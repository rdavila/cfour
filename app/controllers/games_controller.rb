class GamesController < ApplicationController
  before_filter :load_user

  def create
    Game.update_all(finished: true)
    @user.games.create!
    notify_opponent

    redirect_to @user
  end

  private
    def load_user
      @user = User.find(params[:user_id])
    end

    def notify_opponent
      Pusher["user-#{@user.opponent.id}"].trigger('new-game-created', { ok: true })
    end
end
