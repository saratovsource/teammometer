class RenameToRespondents < ActiveRecord::Migration
  def change
    rename_table :survey_participants, :respondents
  end
end
