class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commenter, :default => "Anonymous"
      t.text :body, :null=>false
      t.references :post, foreign_key: true
      t.integer :like, :default => 0, :null=>false
      t.integer :dislike, :default => 0, :null=>false

      t.timestamps
    end
  end
end
