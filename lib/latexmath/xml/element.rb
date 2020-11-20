module Latexmath::XML
  class Element
    attr_accessor :element

    def initialize(tag, attributes = {})
      @element = Ox::Element.new(tag)
      attributes.each do |key, value|
        @element[key] = value
      end
    end

    def <<(node)
      @element << node
      self
    end

    def tag=(tag)
      @element.value = tag
    end

    def text=(value)
      @element << Ox::Raw.new(value)
    end

    def set_attribute(key, value)
      @element[key] = value
    end
  end
end
