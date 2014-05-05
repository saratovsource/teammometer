class AddPermalinkToSurvey < ActiveRecord::Migration
  def change
    change_table :surveys do |t|
      t.string :permalink
    end
  end
end
