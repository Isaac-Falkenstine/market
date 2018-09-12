class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) != 0
    end
  end

  def sorted_item_list
    all_items_array = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten
    all_items_array.uniq.sort
  end

  def total_inventory
    array = @vendors.map do |vendor|
      vendor.inventory
    end

    array.flat_map(&:values).sum
  end
end
