class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.float :rating
      t.text :blurb
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
