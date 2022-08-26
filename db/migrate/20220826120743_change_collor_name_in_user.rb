class ChangeCollorNameInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :header_collor, :color
  end
end
