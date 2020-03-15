describe Chat do
  subject(:chat) { described_class.create(first_user: first_user, second_user: second_user) }

  let(:company) { create :company }
  let(:first_user) { create :user, company: company }
  let(:second_user) { create :user, company: company }

  let!(:message_1) { create :message, chat: chat, sender: second_user, read_at: 1.day.ago }
  let!(:message_2) { create :message, chat: chat, sender: second_user, read_at: nil }

  describe "#interlocutor" do
    subject(:interlocutor) { chat.interlocutor(first_user) }

    it { is_expected.to eq(second_user) }
  end

  describe "#unread_messages_for" do
    subject(:unread_messages_for) { chat.unread_messages_for(first_user) }

    it { is_expected.to match_array([message_2]) }
  end
end
