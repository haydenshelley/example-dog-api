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
        breed: params[:breed]
      )
      @dog.save
      render :show
    else
      render json: {message: "User must be logged in to create a new dog"}
    end
  end
end