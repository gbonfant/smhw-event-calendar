require 'rails_helper'

describe Event do
  it 'validates the presence of a starting date' do
    params = { title: 'Event title', end_date: 2.days.from_now }

    expect(Event.create(params)).to be_invalid
  end

  it 'validates the presence of an ending date' do
    params = { title: 'Event title', start_date: 2.days.from_now }

    expect(Event.create(params)).to be_invalid
  end

  it 'validates that the end date is not in the past' do
    params = { title: 'Event title', start_date: 2.days.from_now, end_date: 2.days.ago }

    expect(Event.create(params)).to be_invalid
  end
end
