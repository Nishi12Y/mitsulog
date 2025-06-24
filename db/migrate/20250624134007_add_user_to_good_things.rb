class AddUserToGoodThings < ActiveRecord::Migration[7.2]
  def change
    add_reference :good_things, :user, foreign_key: true, null: false
  end
end
