resource "Api/V1/Companies" do
  include_context :api_headers
  include_context :when_api_user_signed_in

  let(:name) { "Flatsoft" }

  let(:expected_data) do
    {
      "id" => company.id,
      "name" => "Flatsoft",
      "slug" => "fs"
    }
  end

  patch "/api/v1/company" do
    parameter :name, "Name", scope: :company, required: true

    example_request "Update company" do
      expect(response_status).to eq 200
      expect(json_response_body).to eq(expected_data)
    end
  end
end
