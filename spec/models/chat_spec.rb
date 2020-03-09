describe Chat do
  subject(:chat) { described_class.create(first_user: first_user, second_user: second_user) }

  let(:company) { create :company }
  let(:first_user) { create :user, company: company }
  let(:second_user) { create :user, company: company }

  describe "#interlocutor" do
    subject(:interlocutor) { chat.interlocutor(first_user) }

    it { is_expected.to eq second_user }
  end
end
