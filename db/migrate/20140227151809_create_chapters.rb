class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :chapter_id
      t.text :content

      t.timestamps
    end
  end
end
