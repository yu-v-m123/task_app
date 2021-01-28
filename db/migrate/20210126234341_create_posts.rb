class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start
      t.date :finish
      t.boolean :check
      t.text :memo

      t.timestamps
    end
  end
end
