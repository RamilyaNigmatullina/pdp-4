describe ChatPolicy do
  let(:policy) { described_class.new(chat, user: user) }
  let(:chat) { build_stubbed :chat }
  let(:user) { build_stubbed :user }

  describe "#index" do
    subject { policy.apply(:index?) }

    it { is_expected.to be_truthy }
  end

  describe "#create" do
    subject { policy.apply(:create?) }

    it { is_expected.to be_truthy }
  end
end
