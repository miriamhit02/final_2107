require './lib/item'

RSpec.describe Item do
  it 'exists and has name' do
    item1 = Item.new('Chalkware Piggy Bank')

    expect(item1).to be_a(Item)
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it 'can add bid' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expected = {
      attendee2 => 20,
      attendee1 => 22
    }
    expect(item1.bids).to eq(expected)
  end

  it 'can find highest bid' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)
  end
end
