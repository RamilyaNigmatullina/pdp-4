describe FilteredMessagesQuery do
  subject(:query) { described_class.new(relation, filter_params) }

  let(:relation) { Message.all }
  let(:filter_params) { {} }

  let!(:message_1) { create :message, created_at: Time.zone.now }
  let!(:message_2) { create :message, created_at: 1.hour.ago }
  let!(:message_3) { create :message, created_at: 2.hours.ago }

  describe ".all" do
    subject(:all) { query.all }

    it { is_expected.to match_array([message_1, message_2, message_3]) }

    context "with created_at_until param" do
      let(:filter_params) { { created_at_until: 30.minutes.ago } }

      it { is_expected.to match_array([message_2, message_3]) }
    end
  end
end
