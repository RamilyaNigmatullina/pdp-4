describe Chats::UserPolicy do
  let(:policy) { described_class.new(user, user: user) }
  let(:user) { build_stubbed :user }

  describe "#index" do
    subject { policy.apply(:index?) }

    it { is_expected.to be_truthy }
  end
end
