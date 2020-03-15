describe FilteredUsersQuery do
  subject(:query) { described_class.new(relation, filter_params) }

  let(:relation) { User.with_deleted }
  let(:filter_params) { {} }

  let!(:user) { create :user, :admin }
  let!(:archived_user) { create :user, :archived, company: company }
  let(:company) { user.company }

  describe ".all" do
    subject(:all) { query.all }

    it { is_expected.to match_array([user, archived_user]) }

    context "with archived parameter" do
      context "with true value" do
        let(:filter_params) { { archived: "true" } }

        it { is_expected.to match_array([archived_user]) }
      end

      context "with false value" do
        let(:filter_params) { { archived: "false" } }

        it { is_expected.to match_array([user]) }
      end
    end
  end
end
