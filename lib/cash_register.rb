class CashRegister

	attr_accessor :total, :discount, :last_transaction

	def initialize(discount = nil)
		@total = 0
		@discount = discount
		@items = []
	end


	def add_item(title, price, quantity = nil)
		if quantity == nil
			self.total += price
			@items << title
			@last_transaction = price
		else
			self.total += price * quantity
			quantity.times {@items << title}
			@last_transaction = price * quantity
		end
	end

	def apply_discount
		if self.discount == nil
			return "There is no discount to apply."
		else
			self.total -= self.total * self.discount / 100
			return "After the discount, the total comes to $#{self.total}."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		self.total -= @last_transaction
	end

end
