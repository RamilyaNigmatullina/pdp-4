describe MessagePolicy do
  let(:policy) { described_class.new(message, user: user) }

  let(:company) { create :company }

  let(:user) { create :user, company: company }
  let(:another_user) { create :user, company: company }

  let(:message) { create :message, chat: chat }
  let(:chat) { create :chat, first_user: user, second_user: another_user }

  describe "#index" do
    subject { policy.apply(:index?) }

    it { is_expected.to be_truthy }

    context "when it's not a user chat" do
      let(:chat) { create :chat }

      it { is_expected.to be_falsey }
    end
  end

  describe "#create" do
    subject { policy.apply(:create?) }

    it { is_expected.to be_truthy }

    context "when it's not a user chat" do
      let(:chat) { create :chat }

      it { is_expected.to be_falsey }
    end
  end
end
