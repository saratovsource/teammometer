class CreateSurveyParticipants < ActiveRecord::Migration
  def change
    create_table :survey_participants do |t|
      t.string :email
      t.string :name
      t.references :survey, index: true

      t.timestamps
    end
  end
end
