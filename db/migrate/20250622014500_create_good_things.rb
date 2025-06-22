class CreateGoodThings < ActiveRecord::Migration[7.2]
  def change
    create_table :good_things do |t|
      t.references :diary, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
