class ParentsController < ApplicationController
  before_action :authenticate_hacker!
  before_action :fetch_parent, only: [:update, :edit, :destroy, :show]
  before_action :ensure_is_admin, only: [:edit, :update, :destroy]
  before_action :ensure_is_editor, only:[:index, :show, :new, :create]
  def index

    @parents = Parent.paginate(:page => params[:page], :per_page => 10).order('first_name ASC')
    if params[:first_name].present?
      @parents = @parents.by_first_name(params[:first_name])
    end
    if params[:church].present?
      @parents = @parents.by_church(params[:church])
    end
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      flash[:success] = "Padre creado con éxito"
      redirect_to @parent
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @parent.destroy
    flash[:error] = "Padre eliminado con éxito"
    redirect_to parents_path
  end

  def edit
  end

  def update
    if @parent.update(parent_params)
      flash[:success] = "Padre actualizado con éxito"
      redirect_to parents_path
    else
      render :edit
    end
  end
  
  private
    def parent_params
      params.require(:parent).permit(:first_name,:last_name, :email, :phone, :amount_paid, :church)
    end

    def fetch_parent
      @parent = Parent.find_by(id: params[:id])
      unless @parent
        flash[:error] = "El padre no existe"
        redirect_to root_path     
      end
    end

    

end