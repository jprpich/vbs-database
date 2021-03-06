class VolunteersController < ApplicationController
  before_action :authenticate_hacker!
  before_action :fetch_volunteer, only: [:update, :edit, :destroy, :show]
  before_action :ensure_is_admin, only: [:edit, :update, :destroy]
  before_action :ensure_is_editor, only:[:index, :show, :new, :create]
  def index
    @volunteers = Volunteer.order('first_name ASC')

    if params[:first_name].present?
      @volunteers = @volunteers.by_first_name(params[:first_name])
    end
    if params[:church].present?
      @volunteers = @volunteers.by_church(params[:church])
    end
    if params[:role_type].present?
      @volunteers = @volunteers.by_role_type(params[:role_type])
    end
  end

  def decoration
  end

  def logistics
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      flash[:success] = "Volunteer creado con éxito"
      redirect_to volunteers_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @volunteer.destroy
    flash[:error] = "Volunteer eliminado con éxito"
    redirect_to volunteers_path
  end

  def edit
  end

  def update
    if @volunteer.update(volunteer_params)
      flash[:success] = "Volunteer actualizado con éxito"
      redirect_to @volunteer
    else
      render :edit
    end
  end
  
  private
    def volunteer_params
      params.require(:volunteer).permit(:first_name,:last_name, :email, :phone, :church, :age, :identification, :role_type)
    end

    def fetch_volunteer
      @volunteer = Volunteer.find_by(id: params[:id])
      unless @volunteer
        flash[:error] = "El volunteer no existe"
        redirect_to root_path     
      end
    end

end