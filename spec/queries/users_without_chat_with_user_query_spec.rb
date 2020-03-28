describe UsersWithoutChatWithUserQuery do
  subject(:query) { described_class.new(relation, user: user) }

  let(:relation) { User.all }

  let(:company) { user.company }

  let!(:user) { create :user, :admin }
  let!(:second_user) { create :user, :admin, company: company }
  let!(:third_user) { create :user, :admin, company: company }

  before { create :chat, first_user: user, second_user: second_user }

  describe ".all" do
    subject(:all) { query.all }

    it { is_expected.to match_array([third_user]) }
  end
end
