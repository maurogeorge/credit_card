module CreditCard
  class LuhnValidator
    extend Forwardable

    def_delegator :credit_card, :number

    def initialize(credit_card)
      @credit_card = credit_card
    end

    def call
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

      attr_reader :credit_card
  end
end
