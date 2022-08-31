class AddTopicToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :topic, :string
  end
end
