describe CompanyRegistration::PrepareParams do
  subject(:context) { described_class.call(company_params: company_params) }

  let(:company_params) do
    {
      name: "FS",
      slug: "fs",
      admin_attributes: {
        email: "john.smith@example.com",
        full_name: "John Smith",
        password: "password"
      }
    }
  end

  let(:expected_params) do
    {
      company_params: {
        name: "FS",
        slug: "fs"
      },
      user_params: {
        email: "john.smith@example.com",
        full_name: "John Smith",
        password: "password",
        role: "admin"
      }
    }
  end

  describe ".call" do
    it { expect(context).to have_attributes(expected_params) }
  end
end
