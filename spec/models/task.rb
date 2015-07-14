require 'rails_helper'

RSpec.describe Task do
  it { should have_and_belong_to_many :people }
end
