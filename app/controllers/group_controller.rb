class GroupController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
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
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:notice] = 'The group has been updated.'
      redirect_to group_path
    else
      flash[:notice] = 'The group was not updated successfully.'
      redirect_to group_path
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_url
  end

  private
  def group_params
    params.require(:group).permit(:name, :contact_ids => [])
  end


end
