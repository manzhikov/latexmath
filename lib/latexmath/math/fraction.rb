module Latexmath::Math
  class Fraction
    attr_accessor :numerator
    attr_accessor :denominator

    def initialize(numerator, denominator)
      @numerator = numerator
      @denominator = denominator
    end
  end
end
