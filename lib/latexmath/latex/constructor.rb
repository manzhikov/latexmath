module Latexmath::Latex
  class Constructor
    def initialize(cs, parameters = [])
      @cs = cs
    end

    def parse
      if @cs == 'frac'
      end
    end

    def to_mathml
      element = Latexmath::XML::Element.new('mi')
      element.text = @cs
      element
    end
  end
end
