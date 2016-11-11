class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @groups = Group.all
    @group = Group.new
  end

  def new_group
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group), notice: 'The group has been created.'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @groups = Group.all
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:notice] = 'The group has been updated.'
      redirect_to contacts_url
    else
      flash[:notice] = 'The group was not updated successfully.'
      redirect_to contacts_url
    end
  end

  def show
    @groups = Group.all
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to contacts_url
  end

  private
  def group_params
    params.require(:group).permit(:name, :contact_ids => [])
  end


end
