require "credit_card/version"
require 'credit_card/type_discover'

module CreditCard
  class CreditCard

    def initialize(number)
      @number = number
    end

    def type
      TypeDiscover.new(self).call
    end

    private

      attr_reader :number
  end
end
