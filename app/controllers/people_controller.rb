class PeopleController < ApplicationController

  def get_belongs_person
    @person = Person.find(params[:id])

    @tasks_belongs_person = @person.tasks.ids

    render json: @tasks_belongs_person
  end

  def assign_task_to_person
    @person = Person.find(params[:id])

    @task = Task.find(params[:task_id])

    if @person.tasks << @task
      @task_belongs_to_people = @person.tasks.ids

      render json: @task_belongs_to_people
    else
      render json: @task.errors
    end
  end

  def index
    @people = Person.all.ids

    render json: @people
  end

  def show
    @person = Person.find(params[:id]).id

    render json: @person
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person
    else
      render json: @person.errors
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors
    end
  end

  def destroy
    @person = Person.find(params[:id])

    @person.destroy

    head :no_content
  end

  private

  def person_params
    params.permit(:name)
  end

end
