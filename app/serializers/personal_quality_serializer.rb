class PersonalQualitySerializer < ApplicationSerializer
  attributes :text

  def text
    object.name
  end
end
