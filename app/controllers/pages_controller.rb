class PagesController < ApplicationController

  before_action :auth_admin, except: [:show]

  def show
    @page = Page.find(params[:id])
    redirect_to @page.next_page if params[:navigate] == 'next'
    redirect_to @page.previous_page if params[:navigate] == 'previous'
  end

  def new
    @page = Page.new(chapter_id: params[:chapter_id])
  end

  def create
    @page = Page.new strong_params
    if @page.save
      redirect_to docs_path
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(strong_params)
    redirect_to docs_path
  end

  def destroy
    @page = Page.find(params[:id])
    @app.destroy
    redirect_to docs_path
  end

  private

  def strong_params
    params.require(:page).permit(:chapter_id, :order, :name, :preface)
  end

  def auth_admin
    return if current_user.is_admin?
    render plain: 'Unauthorized', status: :unauthorized
  end

end
