class RenameTypeToPropertyTypeInProperties < ActiveRecord::Migration[8.0]
  def change
    rename_column :properties, :type, :property_type
  end
end
