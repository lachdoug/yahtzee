module Yahtzee
  class CompleteTurnsController < ApplicationController

    def create
      @game = current_user.games.last
      @game.complete_turn(params[:select])
      render 'yahtzee/games/show'
    end

  end
end
