require 'rails_helper'

RSpec.describe Person do
  it { should have_and_belong_to_many :tasks }
end
