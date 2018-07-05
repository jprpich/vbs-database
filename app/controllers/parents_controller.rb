class ParentsController < ApplicationController
  before_action :fetch_parent, only: [:update, :edit, :destroy]
  def index
    @parents = Parent.all
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
  
  private
    def parent_params
      params.require(:parent).permit(:name, :email, :phone, :amount_paid)
    end

    def fetch_parent
      @parent = Parent.find_by(id: params[:id])
    end

end