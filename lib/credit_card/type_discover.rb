module CreditCard
  class TypeDiscover
    extend Forwardable

    VALID_TYPES = [
      Type.new('AMEX', 15, /^(34|37)/),
      Type.new('Discover', 16, /^6011/),
      Type.new('MasterCard', 16, /^5[1-5]/),
      Type.new('Visa', [13, 16], /^4/),
    ]

    def_delegator :credit_card, :number

    def initialize(credit_card)
      @credit_card = credit_card
    end

    def call
      VALID_TYPES.find(unknown_type) do |type|
        type.same_length?(length) && type.matches_number_pattern?(number)
      end.name
    end

    private

      attr_reader :credit_card

      def unknown_type
        -> { Type.new('Unknown') }
      end

      def length
        number.size
      end
  end
end
