class AddTopicToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :topic_id, :integer
    add_index :articles, :topic_id
  end
end
