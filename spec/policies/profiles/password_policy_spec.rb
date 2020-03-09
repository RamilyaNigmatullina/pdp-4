describe Profiles::PasswordPolicy do
  let(:policy) { described_class.new(user, user: user) }
  let(:user) { build_stubbed :user }

  describe "#update" do
    subject { policy.apply(:update?) }

    it { is_expected.to be_truthy }
  end
end
