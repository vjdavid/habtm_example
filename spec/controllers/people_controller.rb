require 'rails_helper'
require 'pry'

RSpec.describe PeopleController, :type => :controller do

  describe "get_tasks_ids" do
    it "list tasks belongs to one person" do

      person = FactoryGirl.create(:person)
      tasks = []

      5.times do
        tasks << FactoryGirl.create(:task)
      end

      person.tasks << tasks

      get :get_tasks_ids, id: person.id
      body = JSON.parse(response.body)
      expect(body.count).to eq(5)
    end
  end

  describe "POST #post_tasks_ids" do
    it "assigns tasks to people" do
      person = FactoryGirl.create(:person)

      tasks = []

      3.times do
        tasks << FactoryGirl.create(:task)
      end

      tasks_ids = tasks.map { |x| x.id }

      binding.pry
      post :post_tasks_ids, id: person.id, tasks_ids: tasks_ids
      body = JSON.parse(response.body)
      expect(body.count).to eq(3)
    end
  end

  describe "GET #index" do
    it "list all people" do

      5.times { FactoryGirl.create(:person) }

      get :index
      body = JSON.parse(response.body)

      expect(body.count).to eq(5)
    end
  end

  describe "GET #show" do
    it "show one person" do
      person = FactoryGirl.create(:person)

      get :show, id: person.id

      expect(person.id).to eq(person.id)
    end
  end

  describe "POST #create" do
    it "create new person" do
      expect {
        post :create, FactoryGirl.attributes_for(:person)
        body = JSON.parse(response.body)
      }.to change(Person, :count).by(1)
    end
  end

  describe "PUT #update" do
    it "update one person" do
      person = FactoryGirl.create(:person)

      old_name = person.name

      put :update, id: person.id, name: "Holis"
      body = JSON.parse(response.body)

      new_name = body["name"]

      expect(new_name).not_to eq(old_name)
    end
  end

  describe "DELETE #destroy" do
    it "delete one object" do
      person = FactoryGirl.create(:person)
      delete :destroy, id: person.id
      expect(response.body).to eq("")
    end
  end

end
