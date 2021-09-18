class PriceShouldBeARange < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :price, :price_range
    change_column_null :articles, :price_range, true
  end
end
