class Api::PersonalQualitiesController < Api::ApplicationController
  def index
    @personal_qualities = ActsAsTaggableOn::Tag.named_like(params.fetch(:query, "*"))
    respond_with @personal_qualities, each_serializer: PersonalQualitySerializer, root: false
  end
end
