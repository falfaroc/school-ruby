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
        $rules = rules
        $item = Hash.new(0)
    end
    
    def total
        $total = 0
        $item.each do |key, value|
            # print "KEY: " + key.to_s + " VALUE: " + value.to_s + "\n"
            $total += calculate_item(key, value)
            print "TOTAL: " + $total.to_s + "\n"
        end
        # print "TOTAL IS: " + $total.to_s + "\n"
        # print "ENDING\n"
        $total
    end

    def scan item
        print "Scanning: " + item.to_s + "\n"
        $item[item] += 1
        # $total += $rules[item]['base']
    end

    def calculate_item(item, value)
        print "ITEM " + item.to_s + " COUNT: " + value.to_s + "\n"
        quantity = $rules[item].get_discount_amount(value) #(value / $rules[item].get_discount.get_amount).floor
        # print "DISCOUNT QUANTITY: " + $rules[item].get_discount.get_amount.to_s + "\n"
        val = $rules[item].get_discount_value(quantity) #calculate discount value
        print "DISCOUNT VAL: " + val.to_s + "\n"
        val += (value - quantity) * $rules[item].get_price
    end
end