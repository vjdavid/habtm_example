require 'rails_helper'

RSpec.describe TasksController, :type => :controller do

  describe "GET #get_people_ids" do
    it "returns all ids of people" do

      task = FactoryGirl.create(:task)

      persons = []

      3.times do
        persons << FactoryGirl.create(:person)
      end

      task.people << persons

      get :get_people_ids, id: task.id

      body = JSON.parse(response.body)
      expect(body.count).to eq(3)
    end
  end

  describe "POST #post_people_ids" do
    it "assign people to one task" do

      task = FactoryGirl.create(:task)
      persons = []

      3.times do
        persons << FactoryGirl.create(:person)
      end

      people_ids = persons.map { |x| x.id }

      post :post_people_ids, id: task.id, people_ids: people_ids

      body = JSON.parse(response.body)
      expect(body.count).to eq(3)
    end
  end

  describe "GET #index" do
    it "list all tasks" do
       3.times { FactoryGirl.create(:task) }

       get :index
       body = JSON.parse(response.body)

       expect(body.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "show one object" do
      task = FactoryGirl.create(:task)

      get :show, id: task.id

      expect(task).to eq(task)
    end
  end

  describe "POST #create" do
    it "create new object" do
      expect {
        post :create, FactoryGirl.attributes_for(:task)
        body = JSON.parse(response.body)
      }.to change(Task, :count).by(1)
    end
  end

  describe "PUT #update" do
    it "update one object" do
      task = FactoryGirl.create(:task)
       old_name = task.name

       put :update, id: task.id, name: "Bolis"

       body = JSON.parse(response.body)

       new_name = body["name"]
       expect(new_name).not_to eq(old_name)
    end
  end

  describe "DELETE #destroy" do
    it "delete one object" do
      task = FactoryGirl.create(:task)
      delete :destroy, id: task.id
      expect(response.body).to eq("")
    end
  end

end
