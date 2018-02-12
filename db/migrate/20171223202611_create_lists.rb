class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :aboutText
      t.text :photolink
      t.text :link
      t.integer :upvotes, :default => 0, :null=>false
      t.integer :downvotes, :default => 0, :null=>false
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
