class CreateDiaries < ActiveRecord::Migration[7.2]
  def change
    create_table :diaries do |t|
      t.date :date, null: false, default: -> { '(CURRENT_DATE)' }
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
