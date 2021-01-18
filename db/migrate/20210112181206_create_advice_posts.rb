class CreateAdvicePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :advice_posts do |t|
      t.text :description

      t.timestamps
    end
  end
end
