describe ChatNotificationsChannel, type: :channel do
  let(:user) { create :user }

  before { stub_connection(current_user: user) }

  it "subscribes to the stream" do
    subscribe

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("chat_notifications:notifications_for_user_#{user.id}")
  end
end
