class SurveyAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by?(user)
      user.enabled?
    end

    def readable_by?(user)
      true
    end

    def updatable_by?(user)
      user.enabled?
    end

    def deletable_by?(user)
      user.enabled?
    end
  end

  def readable_by?(user)
    true
  end

  def updatable_by?(user)
    resource.interviewer == user
  end

  def deletable_by?(user)
    resource.interviewer == user
  end
end
