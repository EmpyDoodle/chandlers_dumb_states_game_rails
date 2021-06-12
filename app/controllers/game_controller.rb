require 'cdsg.rb'

class GameController < ApplicationController
  def game
   gp = game_params.to_h.values.to_a
   logger.info("***PARAMS = #{gp}")
   @cdsg = CDSG.new(*gp)
  end

  def play_game
   logger.info(game_params)
   @cdsg = CDSG.new(game_params.to_h.values.to_a)
  end

  private
    def game_params
     params.permit(:region, :capitals_mode, :hard_mode)
    end

end
