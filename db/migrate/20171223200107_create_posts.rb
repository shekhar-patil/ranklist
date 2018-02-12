class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :postText
      t.string :category

      t.timestamps
    end
  end
end
