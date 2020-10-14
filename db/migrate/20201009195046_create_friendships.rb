class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user
      t.integer :friend_id
      t.string :friend_username

      t.timestamps
    end
  end
end
