class CreateInterviewForms < ActiveRecord::Migration
  def change
    create_table :interview_forms do |t|
      t.references :respondent, index: true
      t.references :survey, index: true

      t.string :state
      t.timestamps
    end
  end
end
