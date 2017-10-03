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

    def calculate_discount
        $amount * $value
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
    $total = 0
    def initialize(rules)
        # print rules['A']['base'].to_s + "\n"
        $rules = rules
        # print $rules['A']['discount'].get_amount.to_s
    end
    
    def total
         $total
    end

    def scan item
        print "Scanning: " + item.to_s + "\n"
        $total += $rules[item]['base']
    end
end