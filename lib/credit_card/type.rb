module CreditCard
  Type = Struct.new(:name, :length, :number_pattern) do

    def initialize(*args)
      super
      self.length = Array(args[1])
    end

    def same_length?(other_length)
      length.include?(other_length)
    end

    def matches_number_pattern?(number)
      number_pattern =~ number
    end
  end
end
