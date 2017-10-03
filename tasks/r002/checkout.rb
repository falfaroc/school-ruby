# handles discounts
class Discount
    def initialize(amount, value)
        @amount = amount
        @value = value
    end

    def get_amount
        @amount
    end

    def get_value
        @value
    end

    def calculate_discount quantity
        quantity * @value
    end
end

class BasePrice
    attr_reader :discount

    def initialize(price, discount)
        @base_price = price
        @discount = discount
    end

    def get_price
        @base_price
    end

    def get_discount_amount quantity
        if @discount.get_amount == 0
            0
        else
            (quantity / @discount.get_amount).floor
        end
    end

    def get_discount_value quantity
        @discount.calculate_discount(quantity)
    end
end

#Hash map, first value is base price
RULES = {
    'A' => BasePrice.new(50, Discount.new(3,130)),
    'B' => BasePrice.new(30, Discount.new(2,45)),
    'C' => BasePrice.new(20, Discount.new(0,0)),
    'D' => BasePrice.new(15, Discount.new(0,0)),
}

# Immitate a supermarket checkout system
class CheckOut
    def initialize(rules)
        @rules = rules
        @item = Hash.new(0)
    end
    
    def total
        @total = 0
        @item.each do |key, value|
            @total += calculate_item(key, value)
        end
        @total
    end

    def scan item
        @item[item] += 1
    end

    def calculate_item(item, value)
        quantity = @rules[item].get_discount_amount(value) #calculate the discount quantity
        val = @rules[item].get_discount_value(quantity) #calculate discount value
        val += (value - (quantity * @rules[item].discount.get_amount)) * @rules[item].get_price
    end
end