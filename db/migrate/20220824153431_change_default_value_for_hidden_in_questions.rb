class ChangeDefaultValueForHiddenInQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column_default :questions, :hidden, from: nil, to: false
  end
end
