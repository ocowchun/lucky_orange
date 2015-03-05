class AddFiledsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student_no, :string
    add_column :users, :real_name, :string
  end
end
