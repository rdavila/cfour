class UsersController < ApplicationController
  def show
    load_game
  end

  private
    def load_user
      @user = User.find(params[:id])
    end

    def load_game
      load_user
      @game = Game.active.last || @user.games.create!
    end
end
