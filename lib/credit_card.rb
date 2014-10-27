require "credit_card/version"

module CreditCard

  class CreditCard

    def initialize(number)
      @number = number
    end

    def type
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

      attr_reader :number
  end
end
