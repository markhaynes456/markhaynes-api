class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :intro
      t.text :body
      t.text :outro

      t.timestamps null: false
    end
  end
end
