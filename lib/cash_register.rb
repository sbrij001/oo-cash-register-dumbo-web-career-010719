require 'pry'
class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity, :discounted_price, :previous_total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(title,price, quantity=1)
    @previous_total = @total
    @total += price * quantity
    @transactions << price
    i = quantity
    until i == 0
      @items.push(title)
      i -= 1
    end

  end


  # applies the discount to the total price
  # 'returns success message with updated total'
  # subtracts discount from total
  # if there was no discount upon initialization return
  # a string error message that there is no discount to apply
  # binding.pry
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
    @discounted_price = (self.total * @discount * 0.01)
    @total -= @discounted_price
    "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  # returns an array containing all items that have been added
  def items
    @items
  end

  def void_last_transaction
    self.total =  @total - @transactions.pop
  end

end
