class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :headline
      t.string :body
      t.timestamps
    end
  end
  def self.down
    drop_table :comments
  end
end
