describe CompanyRegistration::CreateCompany do
  subject(:create_company) { described_class.call(company_params: company_params) }

  let(:company_params) { { name: "Flatstack", slug: "fs" } }

  describe ".call" do
    it "creates company" do
      expect { create_company }.to change(Company, :count).by(1)
      expect(Company.last).to have_attributes(company_params)
    end

    context "with invalid params" do
      let(:company_params) { { name: "Flatstack", slug: nil } }

      it "doesn't create company" do
        expect { create_company }.not_to change(Company, :count)
        expect(create_company.error).to eq("Slug can't be blank")
      end
    end
  end
end
