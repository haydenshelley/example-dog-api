class DogsController < ApplicationController
  def index
    @dogs = Dog.all 
    render :index
  end

  def create
    if current_user
      @dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: current_user.id
      )
      @dog.save
      render :show
    else
      render json: {message: "User must be logged in to create a new dog"}
    end
  end

  def update
    if current_user
      @dogs = current_user.dogs
      @dog = @dogs.find_by(id: params[:id])
      @dog.update(
        name: params[:name] || @dog.name,
        age: params[:age] || @dog.age,
        breed: params[:breed] || @dog.breed
      )
      render :show
    else
      render json: {message: "You must be the owner to update this dog"}
    end
  end
end