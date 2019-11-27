class AddColumnToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :user_id, :integer
  end
end
