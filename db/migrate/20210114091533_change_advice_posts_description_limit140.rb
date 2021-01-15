class ChangeAdvicePostsDescriptionLimit140 < ActiveRecord::Migration[6.1]
  def up
    change_column :advice_posts, :description, :text, limit: 140
  end

  def down
    change_column :advice_posts, :description, :text
  end
end
