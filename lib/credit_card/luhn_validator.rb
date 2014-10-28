module CreditCard
  class LuhnValidator
    extend Forwardable

    def_delegator :credit_card, :number

    def initialize(credit_card)
      @credit_card = credit_card
      @sum1 = @sum2 = 0
    end

    def call
      pair_of_numbers do |odd, even|
        do_first_sum(odd)
        do_second_sum(even)
      end
      (@sum1 + @sum2) % 10 == 0
    end

    private

      attr_reader :credit_card

      def pair_of_numbers
        number.reverse.chars.each_slice(2) do |odd, even|
          yield(odd, even)
        end
      end

      def do_first_sum(value)
        @sum1 += value.to_i
      end

      def do_second_sum(value)
        double = value.to_i * 2
        double -= 9 if double >= 10
        @sum2 += double
      end
  end
end
