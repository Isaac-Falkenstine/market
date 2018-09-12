class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    value_array = @inventory.values_at(item)
    if value_array[0] == nil
      0
    else
      value_array[0]
    end
  end

  def stock(item, number_to_add)
    value_array = @inventory.values_at(item)
    if value_array[0] != nil
      current_value = value_array[0]
    else
      current_value = 0
    end
    @inventory[item] = (number_to_add + current_value)
  end
end
