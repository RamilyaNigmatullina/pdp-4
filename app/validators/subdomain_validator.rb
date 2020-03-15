class SubdomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    subdomain = Subdomain.new(value: value)

    return if subdomain.valid?

    record.errors.messages[attribute].append(*subdomain.errors.messages[:value])
  end
end
