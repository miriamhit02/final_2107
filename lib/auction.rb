class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpopular = []
    @items.each do |item|
      item.bids
      if item.bids.count == 0
        unpopular << item
      end
    end
    unpopular
  end

  def potential_revenue
    highest = []
    @items.each do |item|
      if item.current_high_bid != nil
        highest << item.current_high_bid
      end
    end
    highest.sum
  end

  def bidders
    @items.flat_map do |item|
      item.bids.map do |att, amount|
        att.name
      end
    end.uniq
  end

  def bidder_info
    bidder_info = {}
    @items.each do |item|
      item.bids.each do |att, amount|
        bidder_info[att] ||= {
          budget: att.budget,
          items: []
        }
        # binding.pry
        if item.bids.include?(att)
          bidder_info[att][:items] << item
        end
      end
    end
    bidder_info
  end
end
