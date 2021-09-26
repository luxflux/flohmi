class AddSoldToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :sold_at, :datetime
  end
end
