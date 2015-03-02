class AddDeadlineToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :deadline, :date
  end
end
