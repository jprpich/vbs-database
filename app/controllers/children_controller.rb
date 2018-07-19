class ChildrenController < ApplicationController
  before_action :authenticate_hacker!
  before_action :fetch_child, only: [:update, :edit, :destroy, :show]
  before_action :ensure_is_admin, only: [:edit, :update, :destroy]
  before_action :ensure_is_editor, only: [:index, :show, :create] 
  def index
    @children = Child.order('first_name ASC')
    if params[:first_name].present?
      @children = @children.by_first_name(params[:first_name])
    end
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
  
  def asign_crews
    @crew_leaders = CrewLeader.all
    @crew_leaders.each do |crew_leader|
      crew_leader.children.clear
    end
    @children = Child.all
    @children.each do |child|
      crew_leader_sample = CrewLeader.all.sample
      if crew_leader_sample.children.count < 5
        child.crew_leader = crew_leader_sample
        child.save
      else
        crew_leader_sample = CrewLeader.all.sample
        if crew_leader_sample.children.count < 5
          child.crew_leader = crew_leader_sample
          child.save
        else 
          crew_leader_sample = CrewLeader.all.sample
          child.crew_leader = crew_leader_sample
          child.save
        end
      end
    end
    redirect_to children_path
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