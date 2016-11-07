class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to(contacts_url), notice: 'The contact has been created.'
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      flash[:notice] = 'The contact has been updated.'
      redirect_to contact_path
    else
      flash[:notice] = 'The contact was not updated successfully.'
      redirect_to contact_path
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :note, :contact_id, :profile_picture)
  end
      
end
