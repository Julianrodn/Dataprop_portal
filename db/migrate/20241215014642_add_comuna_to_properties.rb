class AddComunaToProperties < ActiveRecord::Migration[8.0]
  def change
    add_reference :properties, :comuna, null: false, foreign_key: true
  end
end
