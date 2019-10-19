describe InterlocutorValidator do
  subject(:validator) { described_class.new(options) }

  let(:options) { { attributes: %i[second_user] } }

  let(:chat) { build :chat, first_user: first_user, second_user: second_user }

  let(:first_user) { create :user }
  let(:second_user) { create :user }

  describe "#validate_each" do
    subject(:errors) { chat.errors[:second_user] }

    before { validator.validate(chat) }

    it { is_expected.to be_empty }

    context "when chat already exists" do
      before do
        create :chat, first_user: first_user, second_user: second_user

        validator.validate(chat)
      end

      it { is_expected.not_to be_empty }
    end

    context "when users have the opposite chat" do
      before do
        create :chat, first_user: second_user, second_user: first_user

        validator.validate(chat)
      end

      it { is_expected.not_to be_empty }
    end

    context "when chat with yourself" do
      let(:chat) { build :chat, first_user: first_user, second_user: first_user }

      it { is_expected.not_to be_empty }
    end
  end
end
