class SurveyReportSerializer < ApplicationSerializer
  attributes :title
  has_many :completed_interviews,   serializer: Report::InterviewSerializer
  has_many :incompleted_interviews, serializer: Report::InterviewSerializer
end
