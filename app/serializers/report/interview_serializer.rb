module Report
  class InterviewSerializer < ApplicationSerializer
    has_one :respondent, serializer: Report::RespondentSerializer
    has_many :attraction_users, serializer: Report::UserSerializer
    has_many :referention_users, serializer: Report::UserSerializer
    attributes :personal_quality_list
    attributes :created_at, :updated_at

    def attraction_users
      object.attraction_users.map{|i| i.respondent}
    end

    def referention_users
      object.referention_users.map{|i| i.respondent}
    end
  end
end
