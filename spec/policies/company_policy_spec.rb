describe CompanyPolicy do
  let(:policy) { described_class.new(company, user: user) }
  let(:company) { build_stubbed :company }
  let(:user) { build_stubbed :user, company: company }

  describe "#index" do
    subject { policy.apply(:index?) }

    it { is_expected.to be_truthy }
  end

  describe "#update" do
    subject { policy.apply(:update?) }

    it { is_expected.to be_falsey }

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin, company: company }

      it { is_expected.to be_truthy }
    end
  end
end
