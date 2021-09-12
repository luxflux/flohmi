class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, precision: 19, scale: 4, null: false

      t.timestamps
    end
  end
end
