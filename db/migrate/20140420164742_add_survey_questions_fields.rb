class AddSurveyQuestionsFields < ActiveRecord::Migration
  def change
    change_table :surveys do |t|
      [:attraction_question, :referention_question, :personal_qualities_question].each do |question|
        t.text question
      end
    end
  end
end
