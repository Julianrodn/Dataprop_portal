class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.decimal :price
      t.string :currency
      t.string :comuna
      t.string :address
      t.integer :area
      t.integer :bedrooms
      t.integer :bathrooms
      t.decimal :latitude
      t.decimal :longitude
      t.text :description

      t.timestamps
    end
  end
end
