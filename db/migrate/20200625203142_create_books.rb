class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :summary
      t.integer :author_id
      t.integer :genre_id
      t.date :publish_date

      t.timestamps
    end
  end
end
