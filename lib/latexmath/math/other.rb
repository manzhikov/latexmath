module Latexmath::Math
  class Other
    def initialize(value)
      @value = value
    end

    def to_mathml
      element = Latexmath::XML::Element.new('mo')
      element.text = @value
      element
    end
  end
end
