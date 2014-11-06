class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments = Comment.all
  end

  def new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "Comment is awaiting moderation"
      CommentMailer.delay_for(2.minutes).new_comment(@comment, @commentable)
    else
      instance_variable_set(("@#{@resource.singularize}").to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to request.referrer, notice: "Comment edited successfully"
    else
      redirect_to request.referrer, notice: "There was an error with that action"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:author, :author_email, :author_url, :content)
  end

  def load_commentable
    @resource, id =request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
