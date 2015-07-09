class PeopleController < ApplicationController

  def get_tasks_ids
    @person = Person.find(params[:id])

    render json: @person.tasks.ids
  end

  def post_tasks_ids
    @person = Person.find(params[:id])

    @tasks = Task.find(params[:tasks_ids])

    if @person.tasks << @tasks
      @tasks_belongs_to_people = @person.tasks.ids

      render json: @tasks_belongs_to_people
    else
      render json: @tasks.errors
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
