describe Chat do
  subject(:chat) { described_class.create(first_user: first_user, second_user: second_user) }

  let(:first_user) { create :user }
  let(:second_user) { create :user }

  before do
    Current.user = first_user
  end

  describe "#interlocutor" do
    subject(:interlocutor) { chat.interlocutor }

    it { is_expected.to eq second_user }
  end
end
