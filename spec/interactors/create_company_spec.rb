describe CreateCompany do
  subject(:create_company) { described_class.call(company: company) }

  let(:company) { build :company, admin: admin, name: "Flatstack", slug: "fs" }
  let(:admin) { build :user, :admin, email: "john.smith@example.com", full_name: "John Smith" }

  let(:company_attributes) { { name: "Flatstack", slug: "fs" } }
  let(:admin_attributes) { { email: "john.smith@example.com", full_name: "John Smith" } }

  let(:created_company) { Company.last }

  describe ".call" do
    it "creates company" do
      expect { create_company }.to change(Company, :count).by(1)
      expect(created_company).to have_attributes(company_attributes)
      expect(created_company.admin).to have_attributes(admin_attributes)
    end

    context "with invalid company params" do
      before { create :company, slug: "fs" }

      it "doesn't create company" do
        expect { create_company }.not_to change(Company, :count)
        expect(create_company.step).to eq(1)
      end
    end

    context "with invalid user params" do
      let(:admin) { build :user, :admin, email: "", full_name: "John Smith" }

      it "doesn't create company" do
        expect { create_company }.not_to change(Company, :count)
        expect(create_company.step).to eq(2)
      end
    end
  end
end
