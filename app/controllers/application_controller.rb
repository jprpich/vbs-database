class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_is_admin
    unless current_hacker.try(:admin?)
      flash[:error] = "Sólo los usuarios de tipo administrador pueden acceder a esta sección"
      redirect_to root_path
    end
  end
end
