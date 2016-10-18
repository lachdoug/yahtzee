class RunAppsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @apps = App.where(user_id: params[:user_id], published: true)
  end

  def show
    @app = App.find(params[:id])
    @app = nil unless @app.published || @app.user == current_user
    render html: @app.file.html_safe, layout: false
  end

end
