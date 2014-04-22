class SurveyReport < Survey

  def completed_interviews
    interview_forms.finished
  end

  def incompleted_interviews
    interview_forms.initial
  end

  def sociometry
    cross_table(:attraction_users)
  end

  def referentometry
    cross_table(:referention_users)
  end

  protected

  def cross_table(users_type)
    summary = {}
    hsh = {}
    interview_forms.each do |form_x|
        hsh[form_x.respondent.id] = {}
      interview_forms.each do |form_y|
        position = -1
        summary[form_y.respondent.id] ||= 0
        au = form_x.send(users_type).where(respondent_id: form_y.respondent.id).first
        if au.present?
          position = au.position
          summary[form_y.respondent.id] += position
        end
        hsh[form_x.respondent.id][form_y.respondent.id] = position
        hsh[:summary] = summary
      end
    end
    hsh
  end
end
