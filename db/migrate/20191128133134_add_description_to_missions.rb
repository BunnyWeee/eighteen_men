class AddDescriptionToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :description, :text
  end
end
