resource "Api/V1/Users" do
  include_context :api_headers
  include_context :when_api_user_signed_in

  let!(:second_user) { create :user, email: "matthew.rich@flatstack.com", full_name: "Matthew Rich", company: company }
  let!(:third_user) { create :user, email: "mark.boone@flatstack.com", full_name: "Mark Boone", company: company }

  let(:expected_data) do
    [
      {
        "avatar" => "/images/avatar_32x32.png",
        "email" => "mark.boone@flatstack.com",
        "full_name" => "Mark Boone",
        "id" => third_user.id
      }
    ]
  end

  before { create :chat, first_user: user, second_user: second_user }

  get "/api/v1/users" do
    example_request "Get users" do
      expect(response_status).to eq 200
      expect(json_response_body).to eq(expected_data)
    end
  end
end
