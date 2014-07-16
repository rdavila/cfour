class MovementsController < ApplicationController
  def create
    build_movement

    if @movement.save
      render json: @movement, status: 201
    else
      render json: { errors: @movement.errors.full_messages }, status: 422
    end
  end

  private
    def build_movement
      load_game

      @movement ||= @game.movements.build
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
