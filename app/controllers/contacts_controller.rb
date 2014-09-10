class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you. Your message has been sent'
    else
      flash.now[:error] = 'There was an error with your message'
      render :new
    end
  end
end
