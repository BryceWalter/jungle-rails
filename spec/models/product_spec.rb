require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Should save a new product' do
      @category = Category.new(name: 'Junk')
      @product = Product.new(name: 'Clock', price: 34.50, quantity: 25, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it 'Should throw error if name is not present' do
      @category = Category.new(name: 'Junk')
      @product = Product.new(name: nil, price: 34.50, quantity: 25, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'Should throw error if price is not present' do
      @category = Category.new(name: 'Junk')
      @product = Product.new(name: 'Clock', price: nil, quantity: 25, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'Should throw error if quantity is not present' do
      @category = Category.new(name: 'Junk')
      @product = Product.new(name: 'Clock', price: 34.50, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'Should throw error if category is not present' do
      @category = Category.new(name: 'Junk')
      @product = Product.new(name: 'Clock', price: 34.50, quantity: 25, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
