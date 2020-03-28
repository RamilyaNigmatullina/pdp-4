# frozen_string_literal: true

module AcceptanceHelpers
  def json_response_body
    JSON.parse(response_body)
  end
end

RSpec.configure do |config|
  config.include AcceptanceHelpers, type: :acceptance
end
