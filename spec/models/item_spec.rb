require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:survivor) }

  it { should validate_presence_of(:name) }

  it {
    should validate_inclusion_of(:name)
      .in_array(Item.items.keys)
      .with_message('Invalid item')
  }
end
