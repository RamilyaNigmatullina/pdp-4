resource "Api/V1/Messages" do
  include_context :api_headers
  include_context :when_api_user_signed_in
  include_context :when_time_is_frozen

  let(:second_user) { create :user, company: company }
  let(:chat) { create :chat, first_user: user, second_user: second_user }
  let(:chat_id) { chat.id }
  let!(:message_1) { create :message, chat: chat, sender: user, created_at: 5.minutes.ago, text: "Hello, bro!" }
  let!(:message_2) { create :message, chat: chat, sender: second_user, created_at: 3.minutes.ago, text: "Hi!" }
  let!(:message_3) { create :message, chat: chat, sender: second_user, created_at: 2.minutes.ago, text: "How are you?" }
  let(:fields) { %w[id text sender_id created_at] }

  let(:expected_data) do
    [
      {
        "created_at" => "2020-03-15T10:58:00.000Z",
        "id" => message_3.id,
        "sender_id" => second_user.id,
        "text" => "How are you?"
      },
      {
        "created_at" => "2020-03-15T10:57:00.000Z",
        "id" => message_2.id,
        "sender_id" => second_user.id,
        "text" => "Hi!"
      },
      {
        "created_at" => "2020-03-15T10:55:00.000Z",
        "id" => message_1.id,
        "sender_id" => user.id,
        "text" => "Hello, bro!"
      }
    ]
  end

  get "/api/v1/chats/:chat_id/messages" do
    parameter :chat_id, "Chat Id", required: true
    parameter :fields, "Response fields", required: false

    example "Get messages" do
      do_request

      expect(response_status).to eq 200
      expect(json_response_body).to eq(expected_data)
    end
  end

  post "/api/v1/chats/:chat_id/messages" do
    parameter :text, "Text", scope: :message, required: true

    let(:text) { "I'm fine, thank you." }

    let(:created_message) { Message.last }
    let(:created_serialized_message) do
      {
        created_at: Time.zone.now,
        id: created_message.id,
        sender_id: user.id,
        text: "I'm fine, thank you."
      }
    end

    before { allow(ChatChannel).to receive(:broadcast_to) }

    example "Create message" do
      do_request

      expect(ChatChannel).to have_received(:broadcast_to).with(chat, created_serialized_message).once()

      expect(response_status).to eq 201
    end
  end
end
