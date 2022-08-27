class ChangeDefaultValueForColorInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :color, from: "grey", to: "background: lightgrey;"
  end
end
