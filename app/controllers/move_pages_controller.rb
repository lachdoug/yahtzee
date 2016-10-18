class MovePagesController < ApplicationController

  before_action :auth_admin

  def show
    @page = Page.find(params[:page_id])
    page_order = @page.order
    if page_order > 1
      @page.previous_page.update(order: page_order )
      @page.update(order: page_order -1 )
    end
    redirect_to docs_path
  end

  private

  def auth_admin
    return if current_user.is_admin?
    render plain: 'Unauthorized', status: :unauthorized
  end

end
