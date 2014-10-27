# CreditCard

Sample project to solve the [Ruby Quiz #122](http://rubyquiz.com/quiz122.html) to use as example on a mini course on the [SCTI 2014](www.lcmat.uenf.br/scti/) at UENF.

## Checking Credit Cards

### Problem

Before submitting a credit card to a payment gateway it's important that we run some sanity checks on the number.

A common check that is performed upfront is to validate the card type based on the starting digits and length of card number. The main patterns that we care about are as follows:

    +============+=============+===============+
    | Card Type  | Begins With | Number Length |
    +============+=============+===============+
    | AMEX       | 34 or 37    | 15            |
    +------------+-------------+---------------+
    | Discover   | 6011        | 16            |
    +------------+-------------+---------------+
    | MasterCard | 51-55       | 16            |
    +------------+-------------+---------------+
    | Visa       | 4           | 13 or 16      |
    +------------+-------------+---------------+

All of these card types also generate numbers such that they can be validated by the Luhn algorithm, so that's the second check systems usually try. The steps are:

1. Starting with the next to last digit and continuing with every other digit going back to the beginning of the card, double the digit
2.  Sum all doubled and untouched digits in the number. For digits greater than 9 you will need to split them and sum the independently (i.e. <code>"10", 1 + 0</code>).
3. If that total is a multiple of 10, the number is valid.

For example, given the card number <code>4408 0412 3456 7893</code>:

```
1. 8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3
2. 8+4+0+8+0+4+2+2+6+4+1+0+6+1+4+8+1+8+3 = 70
3. 70 % 10 == 0
```
Thus that card is valid.

Let's try one more, <code>4417 1234 5678 9112</code>:

```
1. 8 4 2 7 2 2 6 4 10 6 14 8 18 1 2 2
2. 8+4+2+7+2+2+6+4+1+0+6+1+4+8+1+8+1+2+2 = 69
3. 69 % 10 != 0
```

This card is not valid.


### Task

Your task is to write a ruby program that accepts credit card numbers. Card numbers must be passed in line by line (one set of numbers per line). The program should print the card in the following format <code>"TYPE: NUMBERS (VALIDITY)"</code>.


### Input and Output

Given the following credit cards:

    4111111111111111
    4111111111111
    4012888888881881
    378282246310005
    6011111111111117
    5105105105105100
    5105 1051 0510 5106
    9111111111111111

I would expect the following output:

    VISA: 4111111111111111       (valid)
    VISA: 4111111111111          (invalid)
    VISA: 4012888888881881       (valid)
    AMEX: 378282246310005        (valid)
    Discover: 6011111111111117   (valid)
    MasterCard: 5105105105105100 (valid)
    MasterCard: 5105105105105106 (invalid)
    Unknown: 9111111111111111    (invalid)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'credit_card'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/credit_card/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
