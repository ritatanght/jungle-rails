require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully with 4 fields set' do
      @category = Category.create(name: "Evergreen")
      @product = @category.products.new(name: "Boxwood", price: 69.99, quantity: 10)
      result = @product.save

      expect(result).to be true
      expect(@product.errors.full_messages).to be_empty
      
    end

    it 'fails to save when name field is set to nil' do
      @category = Category.create(name: "Evergreen")
      @product = @category.products.new( price: 69.99, quantity: 10)
      result = @product.save
      
      expect(result).to be false
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'fails to save when price field is set to nil' do
      @category = Category.create(name: "Evergreen")
      @product = @category.products.new(name: "Boxwood", quantity: 10)
      result = @product.save
      
      expect(result).to be false
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'fails to save when quantity field is set to nil' do
      @category = Category.create(name: "Evergreen")
      @product = @category.products.new(name: "Boxwood", price: 69.99)
      result = @product.save
      
      expect(result).to be false
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'fails to save when category field is set to nil' do
      @product = Product.new(name: "Boxwood", price: 69.99, quantity: 10)
      result = @product.save
      
      expect(result).to be false
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
