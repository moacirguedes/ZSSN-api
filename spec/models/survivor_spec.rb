require 'rails_helper'

RSpec.describe Survivor, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:age) }

  it { should validate_presence_of(:gender) }

  it { should have_many(:item).dependent(:destroy) }

  it { should have_many(:report).dependent(:destroy) }

  it { should accept_nested_attributes_for(:item) }
end
