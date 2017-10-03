#Hash map, first value is base price
RULES = {
    'A' => 50,
    'B' => 30,
    'C' => 20,
    'D' => 15,
}

# Immitate a supermarket checkout system
class CheckOut
	def initialize(rules)
		$C_RULES = rules
    end
    
    def total
        print "TOTAL FUNCTION\n"
    end
end