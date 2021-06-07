class DogActionsController < ApplicationController
     before_action :set_dog
    
    def index
        dog_actions = dog_actions.all
        render json: dog_actions
    end

    def show
       dog_action = DogAction.find(params[:id])
       render json: dog_action
    end

    def create
        dog_action = dog.dog_actions.new
        
        if dog_action.save
            render json: dog_action
        else
            render json: dog_action.errors
        end
    end

    def destroy
        dog_action = DogAction.find_by(params[:id])
        dog_action.destroy
    end

    private

    def set_dog
        dog = Dog.find(params[:dog_id])
    end

    def dog_action_params
        params.require(:dog_action).permit(:name, :time, :description, :mood, :dog_id)
    end

end
end