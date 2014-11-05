class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :preview]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
    @post_attachments = @post.post_attachments.load
  end

  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    authorize @post

    respond_to do |format|
      if @post.save
        params[:post_attachments]['image'].each do |a|
          @post_attachment = @post.post_attachments.create!(:image => a, :post_id => @post.id)
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    current_user.posts << @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        if params[:post_attachments] && params[:post_attachments]['image']
          @post.post_attachments.delete_all

          params[:post_attachments]['image'].each do |a|
            @post_attachment = @post.post_attachments.create!(:image => a, :post_id => @post.id)
          end
        end
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, (:published if PostPolicy.new(current_user, @post).publish?), post_attachments_attributes: [:id, :post_id, :image])
    end
end
