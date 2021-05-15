class AddCountersToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :followers_count, :integer, null: false, default: 0
    add_column :users, :followees_count, :integer, null: false, default: 0
  end
end
