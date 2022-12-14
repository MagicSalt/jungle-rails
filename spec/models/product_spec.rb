require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should check if it saves with all fields filled in' do
      @category = Category.new
      @product = Product.new(
        name: 'Test Product',
        price: 500,
        quantity: 4,
        category: @category
      )
      expect(@product).to be_valid
    end
    
    it 'should check if name is present' do
      @category = Category.new
      @product = Product.new(
        name: nil,
        price: 500,
        quantity: 4,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should check if price is present' do
      @category = Category.new
      @product = Product.new(
        name: 'Test Product',
        price: nil,
        quantity: 4,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'should check if quantity is present' do
      @category = Category.new
      @product = Product.new(
        name: 'Test Product',
        price: 500,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
      
    it 'should check if category is present' do
      @category = Category.name
      @product = Product.new(
        name: 'Test Product',
        price: 500,
        quantity: 4,
        category: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
