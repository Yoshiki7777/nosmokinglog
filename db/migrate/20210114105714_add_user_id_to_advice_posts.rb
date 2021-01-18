class AddUserIdToAdvicePosts < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM advice_posts;'
    add_reference :advice_posts, :user, null: false, index: true
  end

  def down
    remove_reference :advice_posts, :user, index: true
  end
end
