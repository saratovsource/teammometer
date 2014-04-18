angular.module('teammometer')
  .factory 'InterviewForm', [
    'railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
      railsResourceFactory
        url: "/api/interview_forms"
        name: "interview_form"
  ]
