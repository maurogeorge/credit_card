module CreditCard
  class TypeDiscover
    extend Forwardable

    CARDS = [
      {
        name: 'AMEX',
        length: 15,
        number_pattern: /^(34|37)/
      },
      {
        name: 'Discover',
        length: 16,
        number_pattern: /^6011/
      },
      {
        name: 'MasterCard',
        length: 16,
        number_pattern: /^5[1-5]/
      },
      {
        name: 'Visa',
        length: [13, 16],
        number_pattern: /^4/
      }
    ]

    def_delegator :credit_card, :number

    def initialize(credit_card)
      @credit_card = credit_card
    end

    def call
      CARDS.find(->{ { name: 'Unknown' } }) { |c| Array(c[:length]).include?(length) && c[:number_pattern] =~ number }[:name]
    end

    private

      attr_reader :credit_card

      def length
        number.size
      end
  end
end
