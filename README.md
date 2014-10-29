# CreditCard

Sample project to solve the [Ruby Quiz #122](http://rubyquiz.com/quiz122.html) to use as example on a mini course on the [SCTI 2014](www.lcmat.uenf.br/scti/) at UENF.
Provides a interface to inquire if an credit card number is valid or invalid and what is the credit card brand.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'credit_card', github: 'maurogeorge/credit_card'
```

And then execute:

    $ bundle

## Usage

1. Instantiate a new `CreditCard::CreditCard` object with a number.

  ```ruby
  credit_card = CreditCard::CreditCard.new(number)
  ```

1. Use the methods provided by class

   ```ruby
  credit_card.type   # => 'AMEX'
  credit_card.valid? # => true
  credit_card.to_s   # => 'AMEX: 378282246310005 (valid)'
  ```

## Contributing

1. Fork it ( https://github.com/maurogeorge/credit_card/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
