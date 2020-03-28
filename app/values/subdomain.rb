class Subdomain
  include ActiveModel::Model

  SUBDOMAIN_REGEXP = /\A[a-z0-9]+\z/.freeze

  attr_reader :value

  def value=(value)
    @value = value.to_s.downcase
  end

  validates :value, presence: true, length: { in: 2..15 },
    format: SUBDOMAIN_REGEXP, exclusion: { in: :reserved_subdomain_names }

  private

  def reserved_subdomain_names
    YAML.load_file(Rails.root.join("app", "validators", "reserved_subdomains.yml"))
  end
end
