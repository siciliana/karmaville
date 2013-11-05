class AddKarmaOptimizations < ActiveRecord::Migration
  def change
    add_index :karma_points, :user_id 
    add_column :users, :karma_sum, :integer, default: 0
    execute "UPDATE users SET karma_sum = (SELECT SUM(value) FROM karma_points WHERE user_id = users.id)" 
  end
end
