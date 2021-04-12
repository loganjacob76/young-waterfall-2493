class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :age
      t.string :currently_working
      t.string :boolean
    end
  end
end
