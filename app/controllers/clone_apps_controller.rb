class CloneAppsController < ApplicationController

  def show
    if params[:id] == 'exercises'
      @new_apps = App.where(user_id: 1, published: true, exercise: true).map(&:dup)
      @new_apps.each do |new_app|
        new_app.assign_attributes(user_id: current_user.id, published: false)
        new_app.save
      end
      redirect_to apps_path
    else
      @app = App.find(params[:id])
      @app = nil unless @app.published || @app.user == current_user
      @new_app = @app.dup
      @new_app.assign_attributes(user_id: current_user.id, published: false)
      @new_app.save
      redirect_to code_path(app_id: @new_app.id)
    end
  end

end
