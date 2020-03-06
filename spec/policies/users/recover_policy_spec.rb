describe Users::RecoverPolicy do
  let(:policy) { described_class.new(user, user: user) }
  let(:user) { build_stubbed :user }

  describe "#create" do
    subject { policy.apply(:create?) }

    it { is_expected.to be_falsey }

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to be_truthy }
    end
  end
end
