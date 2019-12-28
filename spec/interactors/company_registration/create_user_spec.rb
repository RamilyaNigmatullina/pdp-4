describe CompanyRegistration::CreateUser do
  subject(:create_user) { described_class.call(user_params: user_params, company: company) }

  let(:company) { create :company }
  let(:user_params) do
    {
      email: "john.smith@example.com",
      full_name: "John Smith",
      password: "password",
      role: "admin"
    }
  end
  let(:user_attributes) do
    {
      email: "john.smith@example.com",
      full_name: "John Smith",
      role: "admin",
      company_id: company.id
    }
  end

  describe ".call" do
    it "creates user" do
      expect { create_user }.to change(User, :count).by(1)
      expect(User.last).to have_attributes(user_attributes)
    end

    context "with invalid params" do
      let(:user_params) { { email: "john.smith@example.com" } }

      it "doesn't create user" do
        expect { create_user }.not_to change(User, :count)
        expect(create_user.error).to eq("Password can't be blank, Full name can't be blank")
      end
    end
  end
end
