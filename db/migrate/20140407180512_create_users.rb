class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :state
      t.string :password_digest
      t.string :confirmation_token
      t.string :reset_password_token

      t.timestamps
    end
  end
end
