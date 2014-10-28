require "credit_card/version"
require 'credit_card/type'
require 'credit_card/type_discover'
require 'credit_card/luhn_validator'

module CreditCard
  class CreditCard

    def initialize(number)
      @number = number
    end

    def type
      TypeDiscover.new(self).call
    end

    def valid?
      LuhnValidator.new(self).call
    end

    def to_s
      "#{type}: #{number} (#{valid})"
    end

    private

      attr_reader :number

      def valid
        valid? ? 'valid' : 'invalid'
      end
  end
end
