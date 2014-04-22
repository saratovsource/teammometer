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

  def coe
    @coe = { items: coe_table }
    @coe[:summary] = @coe[:items].map{|k, v| v[:count]}
    @coe[:percent] = coe_percent(@coe[:summary])
    @coe
  end

  protected

  def coe_percent(arr)
    arr.sort!
    n = arr[-5, 5].sum
    m = arr[0, 5].sum
    100 * ( n-m ) / arr.sum
  end

  def coe_table
    personal_qualities.inject({}) do |h, pq|
      position = 0
      quality = {name: pq.name}
      quality[:positions] = interview_forms.inject({}) do |ub, iform|
                      ub[iform.respondent.id] = personal_quality_rank(iform.personal_qualities, pq)
                      position += 1 if ub[iform.respondent.id] > 0
                      ub
                    end
      quality[:count] = position
      h[pq.id] = quality
      h
    end
  end

  def personal_quality_rank(collection, item)
    ind = collection.index(item)
    ind ? ind + 1 : 0
  end

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
