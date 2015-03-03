class AddCountToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :have_homeworks_count, :integer
  end
end
