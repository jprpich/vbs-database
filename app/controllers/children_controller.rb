class ChildrenController < ApplicationController
  before_action :fetch_child, only: [:update, :edit, :destroy]
  def index
    @children = Child.paginate(:page => params[:page], :per_page => 10).order('first_name ASC')
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @child.save
    redirect_to children_path
  end

  def destroy
    @child.destroy
    redirect_to children_path
  end

  def edit
  end

  def update
    @child.update(child_params)
    redirect_to children_path
  end
  
  private
    def child_params
      params.require(:child).permit(:first_name, :last_name, :age, :identification)
    end

    def fetch_child
      @child = Child.find_by(id: params[:id])
    end

end