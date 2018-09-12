require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'
require 'pry'

class MarketTest < MiniTest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3 = Vendor.new("Palisade Peach Shack")
    @vendor_3.stock("Peaches", 65)
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_it_returns_name
    assert_equal "South Pearl Street Farmers Market", @market.name
  end

  def test_it_returns_empty_array_of_vendors
    assert_equal [], @market.vendors
  end

  def test_it_can_add_vendors
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    assert_equal [@vendor_1, @vendor_2, @vendor_3], @market.vendors
  end

  def test_can_return_vendor_names
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, @market.vendor_names
  end

  def test_can_find_vendor_by_products_for_sale
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    assert_equal [@vendor_1, @vendor_3], @market.vendors_that_sell("Peaches")
    assert_equal [@vendor_2], @market.vendors_that_sell("Banana Nice Cream")
  end
end
