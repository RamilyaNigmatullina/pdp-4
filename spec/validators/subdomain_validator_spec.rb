describe SubdomainValidator do
  subject(:validator) { described_class.new(options) }

  let(:options) { { allow_nil: false, attributes: %i[slug] } }

  let(:company) { build :company, slug: slug }
  let(:slug) { "fs" }

  describe "#validate_each" do
    subject(:errors) { company.errors[:slug] }

    before { validator.validate(company) }

    it { is_expected.to be_empty }

    context "when slug is empty" do
      let(:slug) { "" }

      it { is_expected.to match_array ["can't be blank", "is too short (minimum is 2 characters)", "is invalid"] }
    end

    context "when slug is too short" do
      let(:slug) { "f" }

      it { is_expected.to match_array ["is too short (minimum is 2 characters)"] }
    end

    context "when slug is too long" do
      let(:slug) { "flatstackflatstack" }

      it { is_expected.to match_array ["is too long (maximum is 15 characters)"] }
    end

    context "when slug contains invalid chars" do
      let(:slug) { "flatstack!" }

      it { is_expected.to match_array ["is invalid"] }
    end

    context "when slug is reserved subdomain" do
      let(:slug) { "apple" }

      it { is_expected.to match_array ["is reserved"] }
    end
  end
end
