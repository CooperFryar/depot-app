require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "adding unique products to cart" do
    cart = carts(:one)
    product_1 = products(:one)
    product_2 = products(:two)

    cart.add_product(product_1)
    cart.add_product(product_2)

    assert_equal 2, cart.line_items.size
    assert_equal product_1.price + product_2.price, cart.total_price
  end

  test "adding duplicate product to cart" do
    cart = Cart.new

    product = products(:ruby)

    cart.add_product(product)
    cart.add_product(product)

    expected_total_price = product.price + product.price
    assert_equal 2, cart.line_items.size
    assert_equal expected_total_price, cart.total_price
  end
end
