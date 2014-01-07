class CreateNeighbors < ActiveRecord::Migration
  def change
    create_table :neighbors do |t|
      t.string :address
      t.integer :rating

      t.timestamps
    end
  end
end
