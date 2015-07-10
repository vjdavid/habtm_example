class PeopleController < ApplicationController

  before_action :find_person, only: [:get_tasks_ids, :post_tasks_ids, :show, :update, :destroy]

  def get_tasks_ids
    render json: @person.tasks.ids
  end

  def post_tasks_ids
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
    render json: @person.id
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
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors
    end
  end

  def destroy
    @person.destroy

    head :no_content
  end

  private

  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.permit(:name)
  end

end
