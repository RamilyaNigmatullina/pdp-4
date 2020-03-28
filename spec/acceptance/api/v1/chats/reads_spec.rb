resource "Api/V1/Chats/Reads" do
  include_context :api_headers
  include_context :when_api_user_signed_in
  include_context :when_time_is_frozen

  let(:second_user) { create :user, company: company }
  let(:chat) { create :chat, first_user: user, second_user: second_user }
  let(:chat_id) { chat.id }
  let!(:message_1) do
    create :message, chat: chat, sender: user, created_at: 5.minutes.ago, read_at: 4.minutes.ago, text: "Hello, bro!"
  end
  let!(:message_2) do
    create :message, chat: chat, sender: second_user, created_at: 3.minutes.ago, read_at: nil, text: "Hi!"
  end
  let!(:message_3) do
    create :message, chat: chat, sender: second_user, created_at: 2.minutes.ago, read_at: nil, text: "How are you?"
  end

  post "/api/v1/chats/:chat_id/reads" do
    parameter :chat_id, "Chat ID", required: true

    example_request "Read messages" do
      expect(response_status).to eq 200
      expect(message_1.reload.read_at).to eq(4.minutes.ago)
      expect(message_2.reload.read_at).to eq(Time.zone.now)
      expect(message_3.reload.read_at).to eq(Time.zone.now)
    end
  end
end
