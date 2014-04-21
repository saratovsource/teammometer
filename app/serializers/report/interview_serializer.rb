module Report
  class InterviewSerializer < ApplicationSerializer
    has_one :respondent, serializer: Report::RespondentSerializer
    attributes :attraction_users, :referention_users
    attributes :created_at, :updated_at

    def attraction_users
      if object.attraction_users
        object.attraction_users.values
      end
    end

    def referention_users
      if object.referention_users
        object.referention_users.values
      end
    end
  end
end
