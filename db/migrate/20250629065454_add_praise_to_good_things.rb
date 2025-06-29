class AddPraiseToGoodThings < ActiveRecord::Migration[7.2]
  def change
    add_column :good_things, :praise, :string, null: false
  end
end
