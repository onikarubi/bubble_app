class RemoveUserIdFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, foreign_key: true
  end
end
