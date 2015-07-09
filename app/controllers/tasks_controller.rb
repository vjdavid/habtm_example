class TasksController < ApplicationController

  def get_people_ids
    @task = Task.find(params[:id])

    render json: @task.people.ids
  end

  def post_people_ids
    @task = Task.find(params[:id])

    @people = Person.find(params[:people_ids])

    if @task.people << @people
      @people_belongs_to_tasks = @task.people.ids

      render json: @people_belongs_to_tasks
    else
      render json: @task.errors
    end
  end

  def index
    @tasks = Task.all.ids

    render json: @tasks
  end

  def show
    @task = Task.find(params[:id]).id

    render json: @task
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task
    else
      render json: @task.errors
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    head :no_content
  end

  private

  def task_params
    params.permit(:name, :description)
  end

end
