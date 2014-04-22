class RemoveHstoreColumns < ActiveRecord::Migration
  def change
    remove_column :interview_forms, :attraction_users
    remove_column :interview_forms, :referention_users
  end
end
