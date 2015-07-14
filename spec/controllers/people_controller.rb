require 'rails_helper'
require 'pry'

RSpec.describe PeopleController, :type => :controller do

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
      body = JSON.parse(response.body)

      expect(body).to eq(person.id)
    end
  end

end
