resource "Api/V1/Profiles" do
  include_context :api_headers
  include_context :when_api_user_signed_in

  let(:full_name) { "John Doe" }

  let(:expected_data) do
    {
      "avatar" => "/images/avatar_32x32.png",
      "email" => "john.smith@example.com",
      "full_name" => "John Doe",
      "id" => user.id
    }
  end

  patch "/api/v1/profile" do
    parameter :full_name, "Full name", scope: :user, required: true

    example "Update user" do
      do_request

      expect(response_status).to eq 200
      expect(json_response_body).to eq(expected_data)
    end
  end
end
