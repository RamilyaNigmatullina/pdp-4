require "rspec_api_documentation"
require "rspec_api_documentation/dsl"

RspecApiDocumentation.configure do |config|
  config.app = Rails.application
  config.format = :json
  config.docs_dir = Rails.root.join("doc", "api")
  config.request_headers_to_include = %w[Accept Content-Type Authorization]
  config.response_headers_to_include = %w[Content-Type]
  config.keep_source_order = true
  config.request_body_formatter = :json
end
