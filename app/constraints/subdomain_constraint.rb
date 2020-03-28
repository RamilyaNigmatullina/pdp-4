class SubdomainConstraint
  def matches?(request)
    Subdomain.new(value: request.subdomain).valid?
  end
end
