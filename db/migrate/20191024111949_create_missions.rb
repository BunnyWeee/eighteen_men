class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :priority
      t.integer :status
      t.datetime :start_time
      t.datetime :complete_time

      t.timestamps
    end
  end
end
