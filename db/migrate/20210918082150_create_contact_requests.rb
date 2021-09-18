class CreateContactRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_requests do |t|
      t.references :article, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false

      t.decimal :price, precision: 19, scale: 4
      t.text :message

      t.timestamps
    end
  end
end
