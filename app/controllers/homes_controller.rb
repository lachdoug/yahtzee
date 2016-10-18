class HomesController < ApplicationController

  def show
    @users = User.ranked_users
  end

end
