class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :location
      t.string :headline
      t.text :body
      t.timestamps
    end
  end
end
