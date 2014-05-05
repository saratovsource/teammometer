class GeneratePermalinkForSurveys < ActiveRecord::Migration
  def up
    Survey.find_each do |survey|
      survey.update_attribute(:permalink, SecureRandom.urlsafe_base64(32))
    end
  end
end
