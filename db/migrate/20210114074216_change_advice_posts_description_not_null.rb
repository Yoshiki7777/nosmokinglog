class ChangeAdvicePostsDescriptionNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :advice_posts, :description, false
  end
end
