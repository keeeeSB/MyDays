class CreateDiaryTags < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_tags do |t|
      t.references :diary, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
