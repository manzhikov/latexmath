module Latexmath
  class Stomach
    def initialize(tokens)
      @tokens = tokens
      @output = []
    end

    def parse_tokens
      @tokens.each_with_index do |token, index|
        if token.cat_code == Core::Token::CC_LETTER
          @output << Latexmath::Math::Identifier.new(token)
        elsif token.cat_code == Core::Token::CC_OTHER
          @output << Latexmath::Math::Other.new(token)
        elsif token.cat_code == Core::Token::CC_CS
          Latexmath::Math.parse_cs(@tokens[index, @tokens.size])
          # @output << Latexmath::Math::Constructor.new(token)
        end
      end
    end

    def render
      xmlns = 'http://www.w3.org/1998/Math/MathML'
      display = 'block'

      doc = Latexmath::XML::Document.new
      math = Latexmath::XML::Element.new('math', { xmlns: xmlns, display: display })
      doc << math.element
      mrow = Latexmath::XML::Element.new('mrow')
      math << mrow.element

      @output.each do |item|
        element = item.to_mathml
        mrow << element.element
      end

      Ox.dump(doc.document, indent: -1)
    end

    def to_math
      parse_tokens
      render
    end
  end
end

