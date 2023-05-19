class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity=1)
      self.total += price * quantity
      quantity.times { self.items << title }
      self.last_transaction = price * quantity
    end
  
    def apply_discount
      if self.discount > 0
        self.total *= (1 - self.discount/100.0)
        "After the discount, the total comes to $#{self.total.to_i}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
      self.last_transaction = 0
      self.items.pop
      self.total = 0.0 if self.items.empty?
    end
end
  
