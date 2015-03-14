class AddLastSubmitAtToHaveHomeworks < ActiveRecord::Migration
  def change
    add_column :have_homeworks, :last_submit_at, :datetime
  end
end
