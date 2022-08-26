class AddCollorToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :header_collor, :string, default: "grey"
  end
end
