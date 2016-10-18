class YahtzeeGamesController < ApplicationController

  def new
    @game = current_user.games.create
  end

end
