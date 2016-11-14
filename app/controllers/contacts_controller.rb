class ContactsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @contacts = Contact.order(sort_column + " " + sort_direction)
    @groups = Group.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # search method
  def search
    if params[:search]
      @searched = Contact.search(params[:search]).order(sort_column + " " + sort_direction)
    else
      @searched = Contact.all.order(sort_column + " " + sort_direction)
    end
    respond_to do |format|
      format.js
    end
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.js
    end
  end

  # retrieves all contacts
  def all
    @selected = Contact.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.js
    end
  end

  # retrieves contacts from the selected group
  def from_group
    group = Group.find(params[:group_id])
    @selected = group.contacts.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      respond_to do |format|
        format.js { render :action => "display_error"}
      end
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      redirect_to contact_path(@contact)
    else
      redirect_to contact_path
    end
  end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :note, :contact_id, :profile_picture, group_ids: [] )
  end

  def sortable_columns
   ["first_name", "last_name", "email"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "first_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
