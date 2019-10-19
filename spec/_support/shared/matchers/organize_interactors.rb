RSpec::Matchers.define :organize_interactors do |*interactors|
  match do |organizer|
    expect(organizer.class.organized).to eq(interactors)
  end
end
