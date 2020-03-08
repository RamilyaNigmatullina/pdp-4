describe UserPolicy do
  let(:policy) { described_class.new(user, user: user) }
  let(:user) { build_stubbed :user }

  describe "#index" do
    subject { policy.apply(:index?) }

    it { is_expected.to be_falsey }

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to be_truthy }
    end
  end

  describe "#create" do
    subject { policy.apply(:create?) }

    it { is_expected.to be_falsey }

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to be_truthy }
    end
  end

  describe "#update" do
    subject { policy.apply(:update?) }

    it { is_expected.to be_truthy }
  end

  describe "#destroy" do
    subject { policy.apply(:destroy?) }

    it { is_expected.to be_falsey }

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to be_truthy }
    end
  end
end
