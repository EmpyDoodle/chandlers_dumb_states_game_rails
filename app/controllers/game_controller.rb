require 'cdsg.rb'

class GameController < ApplicationController
  def game
    @cdsg = cdsg
  end

  def guess
    guess = guess_params.to_h.values.first.capitalize
    @cdsg = cdsg
    @cdsg.results << @cdsg.correct_state?(guess) if @cdsg.correct_state?(guess)
    if @cdsg.results.length == @cdsg.data.length
      redirect_to "/game/complete?region=#{params[:region]}"
    else
      game_redirect
    end
  end

  def hint
    @cdsg = cdsg
    game_redirect
  end

  def complete
  end

  private
    def game_params
      params.permit(:region, :capitals_mode, :hard_mode)
    end

    def progress_params
      params.permit(:region, :capitals_mode, :hard_mode, :results)
    end

    def guess_params
      params.permit(:guess)
    end

    def cdsg
      gp = game_params.to_h.values.to_a
      @cdsg = CDSG.new(*gp)
      if params[:results] == nil
      elsif params[:results] == ''
      else
        params[:results].split(',').to_a.each { |r| @cdsg.results << r }
      end
      @cdsg
    end

    def game_redirect
     url_params = [
       "region=#{params[:region]}",
       "capitals_mode=#{params[:capitals_mode]}",
       "hard_mode=#{params[:hard_mode]}",
       "results=#{@cdsg.results.join(',')}"
     ]
     if params[:hint]
       hint = @cdsg.hint(@cdsg.remaining_states.first, params[:hint_count].to_i)
       url_params << "hint=#{hint}"
       url_params << "hint_count=#{params[:hint_count]}"
     end
     redirect_to ["/game?", url_params.join('&')].join
    end

end
