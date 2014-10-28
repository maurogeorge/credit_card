require 'spec_helper'

RSpec.describe CreditCard::CreditCard do

  describe '#type' do

    context 'when is AMEX' do

      it 'have correct type when starts with 37' do
        number = '378282246310005'
        expect(CreditCard::CreditCard.new(number).type).to eq('AMEX')
      end

      it 'have correct type when starts with 34' do
        number = '348282246310005'
        expect(CreditCard::CreditCard.new(number).type).to eq('AMEX')
      end
    end

    context 'when is Discover' do

      it 'have correct type' do
        number = '6011111111111117'
        expect(CreditCard::CreditCard.new(number).type).to eq('Discover')
      end
    end

    context 'when is MasterCard' do

      (1..5).each do |n|
        it "have correct type when start with 5#{n}" do
          number = "5#{n}05105105105100"
          expect(CreditCard::CreditCard.new(number).type).to eq('MasterCard')
        end
      end
    end

    context 'when is Visa' do

      it 'have correct type when number size is 13' do
        number = '4111111111111'
        expect(CreditCard::CreditCard.new(number).type).to eq('Visa')
      end

      it 'have correct type when number size is 16' do
        number = '4111111111111111'
        expect(CreditCard::CreditCard.new(number).type).to eq('Visa')
      end
    end

    context 'when is Unknown' do

      it 'have correct type' do
        number = '9111111111111111'
        expect(CreditCard::CreditCard.new(number).type).to eq('Unknown')
      end
    end
  end

  describe 'valid?' do

    context 'when the number is valid' do

      %w{4111111111111111 4012888888881881 378282246310005
      6011111111111117 5105105105105100 79927398713}.each do |number|
        it "be true with #{number}" do
          expect(CreditCard::CreditCard.new(number).valid?).to eq(true)
        end
      end
    end

    context 'when the number is invvalid' do

      %w{4111111111111 5105105105105106 9111111111111111}.each do |number|
        it "be false with #{number}" do
          expect(CreditCard::CreditCard.new(number).valid?).to eq(false)
        end
      end
    end
  end
end
