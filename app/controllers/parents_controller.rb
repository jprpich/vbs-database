class ParentsController < ApplicationController
  before_action :fetch_parent, only: [:update, :edit, :destroy]
  def index
    @parents = Parent.paginate(:page => params[:page], :per_page => 10).order('name ASC')
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.save
    redirect_to parents_path
  end

  def destroy
    @parent.destroy
    redirect_to parents_path
  end

  def edit
  end

  def update
    @parent.update(parent_params)
    redirect_to parents_path
  end
  
  private
    def parent_params
      params.require(:parent).permit(:name, :email, :phone, :amount_paid)
    end

    def fetch_parent
      @parent = Parent.find_by(id: params[:id])
    end

end