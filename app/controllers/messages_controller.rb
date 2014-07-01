class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      flash[:notice] = "Message sent!"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
