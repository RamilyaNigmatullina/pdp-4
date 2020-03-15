require "feature_spec_helper"

describe ApplicationCable::Connection do
  include_context :when_admin_signed_in

  let(:env) { { "warden" => warden } }
  let(:warden) { double("Warden", user: current_user) } # rubocop:disable RSpec/VerifiedDoubles
  let(:current_user) { user }

  describe "#connect" do
    it "creates connection" do
      connect(env: env)

      expect(connection.current_user).to be(user)
    end

    context "without user" do
      let(:current_user) { nil }

      it "rejects connection" do
        expect { connect(env: env) }.to have_rejected_connection
      end
    end
  end
end
