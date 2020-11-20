module Latexmath::Math
  class Identifier
    def initialize(value)
      @value = value
    end

    def to_mathml
      element = Latexmath::XML::Element.new('mi')
      element.text = @value
      element
    end
  end
end
