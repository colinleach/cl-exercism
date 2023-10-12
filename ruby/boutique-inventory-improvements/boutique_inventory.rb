require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items.map { |i| OpenStruct.new(i) }
  end

  def item_names
    @items.map(&:name).sort
  end

  def total_stock
    @items.map(&:quantity_by_size).map { |item| item.values.sum }.sum
  end
end
