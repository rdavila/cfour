class MovementsController < ApplicationController
  before_filter :load_user

  def create
    build_movement

    if @movement.save
      notify_opponent
      render json: @movement, status: 201
    else
      render json: { errors: @movement.errors.full_messages }, status: 422
    end
  end

  private
    def notify_opponent
      Pusher["user-#{@user.opponent.id}"].trigger('piece-moved',
        { x: @movement.x_position, y: @movement.y_position, color: @user.color }
      )
    end

    def load_user
      @user = User.find(params[:user_id])
    end

    def build_movement
      load_game
      load_user

      @movement ||= @game.movements.build(user_id: @user.id)
      @movement.attributes = movement_params
    end

    def load_game
      @game = Game.find(params[:game_id])
    end

    def movement_params
      movement_params = params[:movement]
      movement_params ? movement_params.permit(:y_position) : {}
    end
end
