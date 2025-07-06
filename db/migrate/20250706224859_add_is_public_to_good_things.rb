class AddIsPublicToGoodThings < ActiveRecord::Migration[7.2]
  def change
    add_column :good_things, :is_public, :boolean, default: false, null: false
  end
end
