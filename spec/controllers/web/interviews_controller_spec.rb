require 'spec_helper'

describe Web::InterviewsController do

  describe "GET 'show'" do
    let(:interview) { create :interview_form }
    it "returns http success" do
      get 'show', id: interview.token
      expect( response ).to be_success
    end
  end

end
