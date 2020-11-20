require 'strscan'

module Latexmath
  class Tokenizer
    TOKEN_REGEX = [
      /{\\bf [^}]+}/,
      /\\\\\[\d+mm\]/,
      /\\Delta/,
      /{\\rm [^}]+}/,
      /\\[a-z]+/,
      /\\\\/,
      /\\\[/,
      /\\\]/,
      /[\{\}\*]/,
      /\\[:;,]/,
      /\\/,
      /[a-z]/,
      /[0-9]+\.[0-9]+/,
      /[0-9]+/,
      / /,
      /./
    ].freeze

    def initialize(text)
      @text = text
      @scanner = StringScanner.new(@text)
      @tokens = []
    end

    def balance(*args)
      Latexmath::Util.balance(*args) or raise(SyntaxError.new(Error.message(:unbalanced_brackets)))
    end

    def tokenize
      while token = next_token
        next if token.cat_code == Core::Token::CC_SPACE && @tokens[-1].cat_code == Core::Token::CC_SPACE

        @tokens << token
      end

      # Remove trailing space
      while @tokens.any? && @tokens[-1].cat_code == Core::Token::CC_SPACE
        @tokens.pop
      end

      @tokens
    end

    def next_token
      # Remove trailing space, but NOT a control space!  End with CR (not \n) since this gets tokenized!
      @scanner.skip(/((\\ )*)\s*$/)
      @scanner.skip(/\n/)

      TOKEN_REGEX.each do |regex|
        next unless @scanner.scan(regex)

        return Latexmath::Core::Token.new(@scanner.matched)
      end

      nil
    end
  end
end
