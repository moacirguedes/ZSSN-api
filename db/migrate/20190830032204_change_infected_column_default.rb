class ChangeInfectedColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :survivors, :infected, :boolean, default: false
  end
end
