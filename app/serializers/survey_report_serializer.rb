class SurveyReportSerializer < ApplicationSerializer
  attributes :title, :sociometry, :referentometry
  has_many :respondents, serializer: Report::UserSerializer
  has_many :completed_interviews,   serializer: Report::InterviewSerializer
  has_many :incompleted_interviews, serializer: Report::InterviewSerializer
end
