class DocsController < ApplicationController

  def show
    @chapters = Chapter.all
  end

  # def new
  #   @app = current_user.apps.build
  # end
  #
  # def create
  #   @app = current_user.apps.build strong_params
  #   if @app.save
  #     redirect_to @app
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @app = current_user.apps.find(params[:id])
  # end
  #
  # def update
  #   @app = current_user.apps.find(params[:id])
  #   @app.update(strong_params)
  #   redirect_to code_path(app_id: @app.id)
  # end
  #
  # def destroy
  #   @app = current_user.apps.find(params[:id])
  #   @app.destroy
  #   redirect_to apps_path
  # end
  #
  # private
  #
  # def strong_params
  #   params.require(:app).permit(:label, :published)
  # end

end
