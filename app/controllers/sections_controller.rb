class SectionsController < ApplicationController

  before_action :auth_admin, except: [:show]

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(page_id: params[:page_id])
  end

  def create
    @section = Section.new strong_params
    if @section.save
      redirect_to page_path(id: @section.page.id)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @section.update(strong_params)
    redirect_to page_path(id: @section.page.id)
  end

  def destroy
    @section = Section.find(params[:id])
    @app.destroy
    redirect_to page_path(id: @section.page.id)
  end

  private

  def strong_params
    params.require(:section).permit(:page_id, :order, :name, :body)
  end

  def auth_admin
    return if current_user.is_admin?
    render plain: 'Unauthorized', status: :unauthorized
  end

end
