class CreateHaveHomeworks < ActiveRecord::Migration
  def change
    create_table :have_homeworks do |t|
      t.integer :user_id
      t.integer :homework_id
      t.string :repo_url
      t.date :submit_date

      t.timestamps null: false
    end
  end
end
