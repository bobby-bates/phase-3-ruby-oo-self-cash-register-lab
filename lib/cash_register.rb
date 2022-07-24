require 'pry'

class CashRegister
  attr_reader :items, :last_transaction_amount
  attr_accessor :discount, :total

  def initialize discount = 0, total = 0
    @total = total
    @discount = discount
    @items = []
    @last_transaction_amount = 0 # Maybe not needed?
  end

  def add_item item, price, quantity = 1
    @last_transaction_amount = price * quantity
    quantity.times { @items << item }
    self.total += price * quantity
  end

  def apply_discount
    if total.zero?
      'There is no discount to apply.'
    else
      total_w_discount = self.total -= (total * discount / 100)
      "After the discount, the total comes to $#{total_w_discount}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= last_transaction_amount
  end
end