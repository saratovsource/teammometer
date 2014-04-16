class AddAdvancesFieldsForInterview < ActiveRecord::Migration
  def change
    change_table :interview_forms do |t|
      t.hstore :attraction_users
      t.hstore :referention_users
      t.string :token
    end
  end
end
