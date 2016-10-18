class CodesController < ApplicationController

  def show
    @app = current_user.apps.find(params[:app_id])
  end

  def update
    @app = current_user.apps.find(params[:app_id])
    @app.update(strong_params)
  end

  private

  def strong_params
    params.require(:app).permit(:file)
  end

end
