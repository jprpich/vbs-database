class ParentsController < ApplicationController
  before_action :authenticate_hacker!
  before_action :fetch_parent, only: [:update, :edit, :destroy, :show]
  def index
    @parents = Parent.paginate(:page => params[:page], :per_page => 10).order('first_name ASC')
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      flash[:success] = "información creada con éxito"
      redirect_to @parent
    else
      flash[:error] = "La información no pudo ser guardada debido a #{@parent.errors.full_messages.to_sentence}" 
        redirect_to new_parent_path
    end
  end

  def show
    unless @parent
      flash[:error] = "El padre no existe"
      redirect_to root_path
    end
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
      params.require(:parent).permit(:first_name,:last_name, :email, :phone, :amount_paid, :church)
    end

    def fetch_parent
      @parent = Parent.find_by(id: params[:id])
    end

end