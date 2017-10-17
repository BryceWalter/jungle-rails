require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
   describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!({
          name:  'Dumb',
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 17,
          price: 1784.99
        })
      @product2 = Product.create!({
          name:  'Lame',
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel2.jpg'),
          quantity: 18,
          price: 224.99
        })
      @product3 = Product.create!({
          name:  'Whatever',
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel3.jpg'),
          quantity: 28,
          price: 124.99
        })
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    xit 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new({
          stripe_charge_id: 'ha678lp',
          email: 'john@boi.com'
        })
      # 2. build line items on @order
      # ...
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end
