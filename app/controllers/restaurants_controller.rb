class RestaurantsController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to task_path(@restaurant)
  end

  def edit; end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def restaurant_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end
end
