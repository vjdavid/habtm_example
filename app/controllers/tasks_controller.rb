class TasksController < ApplicationController

  def get_belongs_task
    @task = Task.find(params[:id])

    @people_belongs_task = @task.people.ids

    render json: @people_belongs_task
  end

  def assign_person_to_task
    @task = Task.find(params[:id])

    @person = Person.find(params[:person_id])

    if @task.people << @person
      @person_belongs_to_tasks = @task.people.ids

      render json: @person_belongs_to_tasks
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
