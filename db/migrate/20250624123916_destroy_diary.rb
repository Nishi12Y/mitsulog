class DestroyDiary < ActiveRecord::Migration[7.2]
  def change
    drop_table :diaries, if_exists: true
  end
end
