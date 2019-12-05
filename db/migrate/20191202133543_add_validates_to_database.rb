class AddValidatesToDatabase < ActiveRecord::Migration[5.2]
  
  def self.up
    change_table :missions do |t|
      t.change :name, :string, null: false
      t.change :description, :text, null: false
    end
  end

  def self.down
    change_table :missions do |t|
      t.change :name, :string
      t.change :description, :text
    end
  end
end
