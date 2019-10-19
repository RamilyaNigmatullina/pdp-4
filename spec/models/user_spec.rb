describe User do
  subject(:user) { create :user }

  describe "#chats" do
    subject(:chats) { user.chats }

    let(:user_1) { create :user }
    let(:user_2) { create :user }

    let!(:chat_1) { create :chat, first_user: user, second_user: user_1 }
    let!(:chat_2) { create :chat, first_user: user_2, second_user: user }
    let!(:chat_3) { create :chat, first_user: user_1, second_user: user_2 }

    it { is_expected.to match_array [chat_1, chat_2] }
  end

  describe "#chat_with" do
    subject(:chat_with) { user.chat_with(user: interlocutor) }

    let(:interlocutor) { user_1 }

    let(:user_1) { create :user }
    let!(:chat) { create :chat, first_user: user, second_user: user_1 }

    it { is_expected.to eq chat }

    context "when users do not have a chat" do
      let(:interlocutor) { create :user }

      it { is_expected.to be_nil }
    end
  end
end
