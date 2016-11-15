class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @groups = Group.all
    @group = Group.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to contacts_path
    else
      respond_to do |format|
        format.js { render :action => "display_error"}
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      render :js => "window.location = '#{contacts_path}'"
    else
      respond_to do |format|
        format.js { render :action => "display_error"}
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to contacts_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :contact_ids => [])
  end
end
