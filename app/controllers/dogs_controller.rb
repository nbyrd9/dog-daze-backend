class DogsController < ApplicationController
    before_action :set_dog, only: [:destroy]
    
    def index
        dogs = Dog.all
        render json: dogs, except: [:created_at, :updated_at], include: [:dog_actions]
    end

    def show
        dog = Dog.find(params[:id])
        render json: dog, except: [:created_at, :updated_at], include: [:dog_actions]
    end

    def create
        dog = Dog.new(dog_params)
        if dog.save
            render json: dog, except: [:created_at, :updated_at], include: [:dog_actions]
        else
            render json: { errors: dog.errors.full_messages }
        end
    end

    def destroy
        dog = Dog.find_by(id: params[:id])
        dog.destroy
        render json: dog
    end

    private

    def set_dog
        @dog = Dog.find(params[:id])
      end

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :id)
    end
end
