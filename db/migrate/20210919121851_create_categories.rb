class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :position, null: false

      t.timestamps
    end

    change_table :articles do |t|
      t.references :category, foreign_key: true
    end

    category = Category.create! name: 'Diverses', position: 999
    Article.update_all category_id: category.id
    change_column_null :articles, :category_id, false
  end
end
