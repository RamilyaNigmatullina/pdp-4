describe Subdomain do
  subject(:subdomain) { described_class.new(value: value) }

  let(:value) { "FS" }

  describe "#value" do
    subject { subdomain.value }

    it { is_expected.to eq("fs") }
  end

  describe "#valid?" do
    subject { subdomain.valid? }

    it { is_expected.to be_truthy }

    context "with reserved subdomain" do
      let(:value) { "www" }

      it { is_expected.to be_falsey }
    end

    context "without subdomain" do
      let(:value) { "" }

      it { is_expected.to be_falsey }
    end

    context "with short subdomain" do
      let(:value) { "a" }

      it { is_expected.to be_falsey }
    end

    context "with long subdomain" do
      let(:value) { "averylongsubdomain" }

      it { is_expected.to be_falsey }
    end

    context "with unpermitted values" do
      let(:value) { "my_subdomain" }

      it { is_expected.to be_falsey }
    end
  end
end
