require "credit_card/version"
require 'credit_card/type'
require 'credit_card/type_discover'

module CreditCard
  class CreditCard

    def initialize(number)
      @number = number
    end

    def type
      TypeDiscover.new(self).call
    end

    def valid?
      s1 = s2 = 0
      number.reverse.chars.each_slice(2) do |odd, even|
        s1 += odd.to_i

        double = even.to_i * 2
        double -= 9 if double >= 10
        s2 += double
      end
      (s1 + s2) % 10 == 0
    end

    private

      attr_reader :number
  end
end
