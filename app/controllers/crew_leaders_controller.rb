class CrewLeadersController < ApplicationController
  before_action :authenticate_hacker!
  before_action :fetch_crew_leader, only: [:update, :edit, :destroy, :show]
  before_action :ensure_is_admin, only: [:edit, :update, :destroy]
  before_action :ensure_is_editor, only:[:index, :show, :new, :create]
  def index
    @crew_leaders = CrewLeader.order('first_name ASC')
    if params[:first_name].present?
      @crew_leaders = @crew_leaders.by_first_name(params[:first_name])
    end
    if params[:church].present?
      @crew_leaders = @crew_leaders.by_church(params[:church])
    end
  end

  def new
    @crew_leader = CrewLeader.new
  end

  def create
    @crew_leader = CrewLeader.new(crew_leader_params)
    if @crew_leader.save
      flash[:success] = "Crew Leader creado con éxito"
      redirect_to @crew_leader
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @crew_leader.children.clear
    @crew_leader.destroy
    flash[:error] = "Crew Leader eliminado con éxito"
    redirect_to crew_leaders_path
  end

  def edit
  end

  def update
    if @crew_leader.update(crew_leader_params)
      flash[:success] = "Crew Leader actualizado con éxito"
      redirect_to @crew_leader
    else
      render :edit
    end
  end
  
  private
    def crew_leader_params
      params.require(:crew_leader).permit(:first_name,:last_name, :email, :phone, :church)
    end

    def fetch_crew_leader
      @crew_leader = CrewLeader.find_by(id: params[:id])
      unless @crew_leader
        flash[:error] = "El crew leader no existe"
        redirect_to root_path     
      end
    end

end