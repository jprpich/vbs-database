class ChildrenController < ApplicationController
  before_action :authenticate_hacker!
  before_action :fetch_child, only: [:update, :edit, :destroy, :show]
  before_action :ensure_is_admin, except: :index
  def index
    @children = Child.paginate(:page => params[:page], :per_page => 10).order('first_name ASC')
  end

  def create
    if params[:parent_id].present?
      parent = Parent.find(params[:parent_id])
      child = parent.children.new(child_params)
      if child.save
        flash[:success] = "Hijo creado con éxito"
        redirect_to parent
      else
        @errors = child.errors.full_messages
        redirect_to parent, :flash => { :error => @errors }
      end
    end 
  end

  def show
  end

  def edit
  end

  def update
    if @child.update(child_params)
      flash[:success] = "Hijo actualizado con éxito"
      redirect_to children_path
    else 
      render 'edit'
    end
  end
  
  def destroy
    @child.destroy
    flash[:error] = "Hijo eliminado con éxito"
    redirect_to @child.parent
  end

  private
    def child_params
      params.require(:child).permit(:first_name, :last_name, :age, :identification, :health_provider, :crew_leader_id )
    end

    def fetch_child
      @child = Child.find_by(id: params[:id])
    end

end