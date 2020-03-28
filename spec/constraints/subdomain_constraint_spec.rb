describe SubdomainConstraint do
  subject(:subdomain_constraint) { described_class.new }

  let(:request) { ActionDispatch::TestRequest.new("HTTP_HOST" => host) }
  let(:host) { "fs.lvh.me" }

  describe "#matches?" do
    subject(:matches?) { subdomain_constraint.matches?(request) }

    it { is_expected.to be_truthy }

    context "without subdomain" do
      let(:host) { "lvh.me" }

      it { is_expected.to be_falsey }
    end

    context "with reserved subdomain" do
      let(:host) { "www.lvh.me" }

      it { is_expected.to be_falsey }
    end
  end
end
