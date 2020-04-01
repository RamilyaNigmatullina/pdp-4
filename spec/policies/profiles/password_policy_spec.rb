describe Profiles::PasswordPolicy do
  let(:policy) { described_class.new(record, user: user) }
  let(:record) { user }
  let(:user) { build_stubbed :user }

  describe "#update" do
    subject { policy.apply(:update?) }

    it { is_expected.to be_truthy }

    context "when record is another user" do
      let(:record) { build_stubbed :user }

      it { is_expected.to be_falsey }
    end
  end
end
