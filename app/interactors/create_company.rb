class CreateCompany
  include Interactor

  delegate :company, to: :context

  def call
    company.save

    context.step = step
  end

  private

  def step
    company_invalid? ? 1 : 2
  end

  def company_invalid?
    (company.attributes.keys.map(&:to_sym) & company.errors.keys).any?
  end
end
