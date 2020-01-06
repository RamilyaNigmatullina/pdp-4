class SubdomainConstraint
  def matches?(request)
    Subdomain.new(subdomain: request.subdomain).valid?
  end
end
