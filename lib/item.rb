class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    if @bids[attendee].nil?
      @bids[attendee] = amount
    else
      @bids[attendee] += amount
    end
  end

  def current_high_bid
    amounts = []
    @bids.each do |bid, amount|
      amounts << amount
    end
    amounts.max
  end
end
