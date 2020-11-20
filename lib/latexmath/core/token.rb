module Latexmath::Core
  class Token
    # Catcodes
    CC_ESCAPE  = 0
    CC_BEGIN   = 1
    CC_END     = 2
    CC_MATH    = 3
    CC_ALIGN   = 4
    CC_EOL     = 5
    CC_PARAM   = 6
    CC_SUPER   = 7
    CC_SUB     = 8
    CC_IGNORE  = 9
    CC_SPACE   = 10
    CC_LETTER  = 11
    CC_OTHER   = 12
    CC_ACTIVE  = 13
    CC_COMMENT = 14
    CC_INVALID = 15
    # Extended Catcodes for expanded output.
    CC_CS     = 16
    CC_MARKER = 17    # non TeX extension!

    def initialize(string)
      @string = string
    end

    def cat_code
      @cat_code ||= find_cat_code
    end

    def to_s
      @string
    end

    def find_cat_code
      # Setup default catcodes.
      case @string
      when "\\"
        CC_ESCAPE
      when "{"
        CC_BEGIN
      when "}"
        CC_END
      when "\$"
        CC_MATH
      when "&"
        CC_ALIGN
      when "\r"
        CC_EOL
      when "#"
        CC_PARAM
      when "^"
        CC_SUPER
      when "_"
        CC_SUB
      when " "
        CC_SPACE
      when "\t"
        CC_SPACE
      when "%"
        CC_COMMENT
      when "~"
        CC_ACTIVE
      when 0.chr
        CC_ESCAPE
      when "\f"
        CC_ACTIVE
      when /^[a-zA-Z]$/
        CC_LETTER
      when /^\\[a-z]+$/
        CC_CS
      else
        CC_OTHER
      end
    end
  end
end
