class CompanyDecorator < ApplicationDecorator
  delegate :id, :name, :slug

  decorates_association :admin
end
