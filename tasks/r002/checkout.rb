# handles discounts
class Discount
    def initialize(amount, value)
        $amount = amount
        $value = value
    end

    def get_amount
        $amount
    end

    def get_value
        $value
    end

    def calculate_discount quantity
        quantity * $value
    end
end

#Hash map, first value is base price
RULES = {
    'A' => {
            'base' => 50,
            'discount' => Discount.new(3,130),
            },
    'B' => {
            'base' => 30,
            'discount' => Discount.new(2,45),
            },
    'C' => 20,
    'D' => 15,
}

# Immitate a supermarket checkout system
class CheckOut
    attr_accessor :total

    def initialize(rules)
        $total = 0

        $rules = rules
        $item = Hash.new(0)
    end
    
    def total
        $item.each do |key, value|
            print "KEY: " + key.to_s + " VALUE: " + value.to_s + "\n"
            calculate_item(key, value)
        end
        # print "TOTAL IS: " + $total.to_s + "\n"
        $total
    end

    def scan item
        # print "Scanning: " + item.to_s + "\n"
        $item[item] += 1
        $total += $rules[item]['base']
    end

    def calculate_item(item, value)
        quantity = (value / $rules[item]['discount'].get_amount).floor

        print "QUANTITY: " + quantity.to_s
    end
end