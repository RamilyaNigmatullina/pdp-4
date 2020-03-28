resource "Api/V1/Chats" do
  include_context :api_headers
  include_context :when_api_user_signed_in

  let(:second_user) { create :user, :kevin_doe, company: company }
  let(:user_id) { second_user.id }

  let(:created_chat) { Chat.last }

  let(:expected_data) do
    {
      "id" => created_chat.id,
      "interlocutor" => {
        "avatar" => "/images/avatar_32x32.png",
        "email" => "kevin.doe@example.com",
        "full_name" => "Kevin Doe",
        "id" => second_user.id
      },
      "last_message" => nil,
      "unread_messages_count" => 0
    }
  end

  post "/api/v1/chats" do
    parameter :user_id, "User ID", scope: :chat, required: true

    example_request "Create chat" do
      expect(response_status).to eq 201
      expect(json_response_body).to eq(expected_data)
    end
  end
end
