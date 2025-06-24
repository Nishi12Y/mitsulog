class FixGoodThings < ActiveRecord::Migration[7.2]
  def change
    remove_column :good_things, :diary_id, :integer, if_exists: true
  end
end
