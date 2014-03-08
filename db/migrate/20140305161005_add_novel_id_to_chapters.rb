class AddNovelIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :novel_id, :integer
  end
end
