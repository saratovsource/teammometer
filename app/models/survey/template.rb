class Survey::Template < ActiveRecord::Base
  acts_as_taggable_on :personal_qualities
  belongs_to :user
end
