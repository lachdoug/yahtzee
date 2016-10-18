class ChaptersController < ApplicationController

  before_action :auth_admin, except: [:show]

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new strong_params
    if @chapter.save
      redirect_to docs_path
    else
      render :new
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update(strong_params)
    redirect_to docs_path
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @app.destroy
    redirect_to docs_path
  end

  private

  def strong_params
    params.require(:chapter).permit(:order, :name, :preface)
  end

  def auth_admin
    return if current_user.username == 'admin'
    render plain: 'Unauthorized', status: :unauthorized
  end

end
