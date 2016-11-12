class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @groups = Group.all
    if params[:search]
      @contacts = Contact.search(params[:search]).order("created_at DESC")
    else
      @contacts = Contact.all.order('created_at DESC')
    end
  end

  def search
    if params[:search]
      @searched = Contact.search(params[:search]).order("created_at DESC")
    else
      @searched = Contact.all.order('created_at DESC')
    end
    respond_to do |format|
      format.js
    end
  end

  def new
    @contact = Contact.new
    @groups = Group.all
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def all
    @selected = Contact.all
    respond_to do |format|
      format.js
    end
  end

  def from_group
    group = Group.find(params[:group_id])
    @selected = group.contacts
    respond_to do |format|
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @groups = Group.all
    if @contact.save
      render :js => "window.location = '#{contacts_path}'"
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @groups = Group.all
    respond_to do |format|
      format.js
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      flash[:notice] = 'The contact has been updated.'
      render :js => "window.location = '#{contacts_path}'"
    else
      flash[:notice] = 'The contact was not updated successfully.'
      redirect_to contact_path
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @groups = Group.all
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @groups = Group.all
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :note, :contact_id, :profile_picture, group_ids: [] )
  end

end
