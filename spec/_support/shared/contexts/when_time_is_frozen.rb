shared_context :when_time_is_frozen do
  let(:current_time) { Time.new(2020, 03, 15, 14, 0_0, 0_0) }

  before { Timecop.freeze(current_time) }

  after { Timecop.return }
end
