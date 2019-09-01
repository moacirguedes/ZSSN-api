require 'rails_helper'

RSpec.describe Report, type: :model do
  it { should belong_to(:survivor) }

  it { should validate_uniqueness_of(:reporter_survivor_id).scoped_to(:survivor_id) }

  it { should validate_presence_of(:reporter_survivor_id) }
end
