require 'spec_helper'

describe Web::InterviewsController do

  describe "GET 'show'" do
    let(:new_interview) { create :active_interview_form }
    let(:interview) { assert(:interview) }
    it "returns http success" do
      get 'show', id: new_interview.token
      expect( response ).to be_success
      expect( interview ).to be_present
    end
  end

end
