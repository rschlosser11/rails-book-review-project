class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :summary
      t.integer :author_id
      t.integer :genre_id
      t.integer :publish_year

      t.timestamps
    end
  end
end
