class AddScoreToHaveHomeworks < ActiveRecord::Migration
  def change
    add_column :have_homeworks, :score, :integer
  end
end
