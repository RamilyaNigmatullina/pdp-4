describe CompanyRegistration::Proceed do
  describe ".organized" do
    let(:expected_interactors) do
      [
        CompanyRegistration::PrepareParams,
        CompanyRegistration::CreateCompany,
        CompanyRegistration::CreateUser
      ]
    end

    subject { described_class.organized }

    it { is_expected.to eq(expected_interactors) }
  end
end
