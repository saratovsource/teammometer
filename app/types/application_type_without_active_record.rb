module ApplicationTypeWithoutActiveRecord
  extend ActiveSupport::Concern

  included do
    include Virtus.model
    include ActiveModel::Model
  end

  module ClassMethods
    def _args
      attribute_set.to_a.map(&:name)
    end
  end

  def persisted?
    false
  end
end
