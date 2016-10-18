module Yahtzee
  class GamesController < ApplicationController

    def show
      @game = current_user.games.last || current_user.games.create
      # @game.roll_result
      # byebug
    end

  end
end
