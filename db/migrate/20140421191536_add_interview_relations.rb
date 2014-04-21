class AddInterviewRelations < ActiveRecord::Migration
  def change
    create_join_table :interview_forms, :respondents, table_name: :user_metrics do |t|
      t.index   :interview_form_id
      t.index   :respondent_id
      t.string  :type
      t.integer :position
    end
  end
end
