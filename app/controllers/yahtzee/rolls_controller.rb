module Yahtzee
  class RollsController < ApplicationController

    def create
      # byebug
      if current_user.games.empty? || current_user.games.last.game_over
        @game = current_user.games.create
        @game.roll
      else
        @game = current_user.games.last
        @game.roll(params[:dice])
      end
      render 'yahtzee/games/show'
    end

  end
end
