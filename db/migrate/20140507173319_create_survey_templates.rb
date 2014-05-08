class CreateSurveyTemplates < ActiveRecord::Migration
  def change
    create_table :survey_templates do |t|
      t.string :title
      t.string :attraction_question
      t.string :referention_question
      t.string :personal_qualities_question
      t.references :user, index: true

      t.timestamps
    end
  end
end
