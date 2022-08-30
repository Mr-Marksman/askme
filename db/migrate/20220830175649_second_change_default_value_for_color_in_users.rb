class SecondChangeDefaultValueForColorInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :color, from: "background: lightgrey;", to: "#d3d3d3" 
  end
end
