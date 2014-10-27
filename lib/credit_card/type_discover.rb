module CreditCard
  class TypeDiscover
    extend Forwardable

    def_delegator :credit_card, :number

    def initialize(credit_card)
      @credit_card = credit_card
    end

    def call
      length = number.size
      if length == 15 && number =~ /^(34|37)/
        'AMEX'
      elsif length == 16 && number =~ /^6011/
        'Discover'
      elsif length == 16 && number =~ /^5[1-5]/
        'MasterCard'
      elsif (length == 13 || length == 16) && number =~ /^4/
        'Visa'
      else
        'Unknown'
      end
    end

    private

      attr_reader :credit_card
  end
end
