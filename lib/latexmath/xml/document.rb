module Latexmath::XML
  class Document
    attr_reader :document

    def initialize
      @document = Ox::Document.new
      instruct = Ox::Instruct.new(:xml)
      instruct[:version] = '1.0'
      instruct[:encoding] = 'UTF-8'
      @document << instruct
    end

    def <<(node)
      @document << node
      self
    end
  end
end
