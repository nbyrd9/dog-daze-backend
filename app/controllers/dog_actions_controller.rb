class DogActionsController < ApplicationController
    def index
        dog_actions = Dog_action.all
        render_json: dog_actions, except: [:created_at, :updated_at]
    end

    def create
        dog_action = Dog_action.new
        if dog_action.save
            render json: dog_action, except: [:created_at, :updated_at]
    end

    def destroy
        dog_action = Dog_action.find_by(params[:id])
        dog_action.destroy
    end

    private

    def dog_action_params
        params.require(:dog_action).permit(:name, :time, :description, :mood, :dog_id)
    end

end
