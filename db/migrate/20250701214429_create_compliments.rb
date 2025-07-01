class CreateCompliments < ActiveRecord::Migration[7.2]
  def change
    create_table :compliments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :good_thing, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
