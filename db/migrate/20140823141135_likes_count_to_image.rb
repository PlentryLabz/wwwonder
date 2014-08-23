class LikesCountToImage < ActiveRecord::Migration
  def change
    add_column :images, :likes_count, :integer, default: 0
  end
end
