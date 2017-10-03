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

    def calculate_discount(quantity)
        quantity * @value
    end
end

# handles the normal prices
class BasePrice
    attr_reader :discount

    def initialize(price, discount)
        @base_price = price
        @discount = discount
    end

    def get_price
        @base_price
    end

    def get_discount_amount(quantity)
        amount_need = @discount.get_amount

        if amount_need == 0
            0
        else
            (quantity / amount_need).floor
        end
    end

    def get_discount_value(quantity)
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
        checkout_total = 0
        @item.each do |key, value|
            checkout_total += calculate_item(key, value)
        end
        checkout_total
    end

    def scan(item)
        @item[item] += 1
    end

    def calculate_item(item, value)
        quantity = get_discount_quantity(item, value)
        val = get_discount_value(item, quantity)
        val += (value - (quantity * get_base_discount_amount(item))) * @rules[item].get_price
    end

    #calculate the discount quantity
    def get_discount_quantity(item, value)
        @rules[item].get_discount_amount(value)
    end

    #calculate discount value
    def get_discount_value(item, quantity)
        @rules[item].get_discount_value(quantity)
    end

    def get_base_discount_amount(item)
        @rules[item].discount.get_amount
    end

end