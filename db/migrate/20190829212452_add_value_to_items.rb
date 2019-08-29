class AddValueToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :value, :integer
  end
end
