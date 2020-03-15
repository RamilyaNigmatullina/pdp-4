describe ChatChannel, type: :channel do
  let(:chat) { create :chat }

  before { stub_connection }

  it "subscribes to the stream" do
    subscribe(chat_id: chat.id)

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_for(chat)
  end
end
