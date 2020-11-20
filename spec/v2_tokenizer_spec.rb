RSpec.describe Latexmath::Tokenizer do

  context 'Sample 1' do
    tex = '\\varepsilon = \\frac{1}{2} ( J + J^t )'
    it 'Tokenize latex string' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:to_s)
      ).to eq(
        ['\\varepsilon', '=', ' ', '\\frac', '{', '1', '}', '{', '2', '}', ' ', '(', ' ', 'J', ' ', '+', ' ', 'J', '^', 't', ' ', ')']
      )
    end

    it 'Tokenize latex codes' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:cat_code)
      ).to eq(
        [16, 12, 10, 16, 1, 12, 2, 1, 12, 2, 10, 12, 10, 11, 10, 12, 10, 11, 7, 11, 10, 12]
      )
    end
  end

  context 'Sample 2' do
    tex = '$$f_i =  \\sum_{j=1}^2 s_{ij} n_j \\quad {\\rm for} \\quad i = 1,2$$'
    it 'Tokenize latex string' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:to_s)
      ).to eq(
        ['$', '$', 'f', '_', 'i', ' ', '=', ' ', '\\sum', '_', '{', 'j', '=', '1', '}', '^', '2', ' ', 's', '_', '{', 'i', 'j', '}', ' ', 'n', '_', 'j', ' ', '\\quad', '{', '\\rm', 'f', 'o', 'r', '}', ' ', '\\quad', 'i', ' ', '=', ' ', '1', ',', '2', '$', '$']
      )
    end

    it 'Tokenize latex codes' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:cat_code)
      ).to eq(
        [3, 3, 11, 8, 11, 10, 12, 10, 16, 8, 1, 11, 12, 12, 2, 7, 12, 10, 11, 8, 1, 11, 11, 2,
         10, 11, 8, 11, 10, 16, 1, 16, 11, 11, 11, 2, 10, 16, 11, 10, 12, 10, 12, 12, 12, 3, 3]
      )
    end
  end

  context 'Sample 3' do
    tex = 'G = {\\displaystyle \\frac{E}{2(1 + \\nu)}}'
    it 'Tokenize latex string' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:to_s)
      ).to eq(
        ['G', ' ', '=', ' ', '{', '\\displaystyle', '\\frac', '{', 'E', '}', '{', '2', '(', '1', ' ', '+', ' ', '\\nu', ')', '}', '}']
      )
    end

    it 'Tokenize latex codes' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:cat_code)
      ).to eq(
        [11, 10, 12, 10, 1, 16, 16, 1, 11, 2, 1, 12, 12, 12, 10, 12, 10, 16, 12, 2, 2]
      )
    end
  end

  context 'Sample 4' do
    tex = '\\bf{x^\\prime} = \\bf{\\xi}'

    it 'Tokenize latex string' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:to_s)
      ).to eq(
        ["\\bf", "{", "x", "^", "\\prime", "}", " ", "=", " ", "\\bf", "{", "\\xi", "}"]
      )
    end

    it 'Tokenize latex codes' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:cat_code)
      ).to eq(
        [16,1,11,7,16,2,10,12,10,16,1,16,2]
      )
    end
  end

  context 'Sample 5' do
    tex = '\\bf{z^\\prime} = \\langle \\bf{\\xi} \\times \\bf{\\eta} \\rangle'

    it 'Tokenize latex string' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:to_s)
      ).to eq(
        ["\\bf", "{", "z", "^", "\\prime", "}", " ", "=", " ", "\\langle", "\\bf", "{", "\\xi", "}", " ", "\\times", "\\bf", "{", "\\eta", "}", " ","\\rangle"]
      )
    end

    it 'Tokenize latex codes' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:cat_code)
      ).to eq(
        [16,1,11,7,16,2,10,12,10,16,16,1,16,2,10,16,16,1,16,2,10,16]
      )
    end
  end

  context 'Multiline sample' do
    tex = "\\begin{split}
    C_L &= {L \\over {1\\over2} \\rho_\\textrm{ref} q_\\textrm{ref}^2 S} \\\\ \\\\
    C_D &= {D \\over {1\\over2} \\rho_\\textrm{ref} q_\\textrm{ref}^2 S} \\\\ \\\\
    \\vec{C}_M &= {\\vec{M} \\over {1\\over2} \\rho_\\textrm{ref} q_\\textrm{ref}^2 c_\\textrm{ref} S_\\textrm{ref}},
    \\end{split}"

    it 'Tokenize latex string' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:to_s)
      ).to eq(
        ['\\begin','{','s','p','l','i','t','}',' ','C','_','L',' ','&','=',' ','{','L',' ',
          '\\over','{','1','\\over','2','}',' ','\\rho','_','\\textrm','{','r','e','f','}',' ','q','_',
          '\\textrm','{','r','e','f','}','^','2',' ','S','}',' ','\\\\',' ','\\\\',
          ' ','C','_','D',' ','&','=',' ','{','D',' ','\\over','{','1','\\over','2','}',' ',
          '\\rho','_','\\textrm','{','r','e','f','}',' ','q','_',
          '\\textrm','{','r','e','f','}','^','2',' ','S','}',' ','\\\\',' ','\\\\',
          ' ','\\vec','{','C','}','_','M',' ','&','=',' ','{','\\vec','{','M','}',' ',
          '\\over','{','1','\\over','2','}',' ','\\rho','_',
          '\\textrm','{','r','e','f','}',' ','q','_',
          '\\textrm','{','r','e','f','}','^','2',' ','c','_',
          '\\textrm','{','r','e','f','}',' ','S','_',
          '\\textrm','{','r','e','f','}','}','','',' ','\\end','{','s','p','l','i','t','}']
      )
    end

    it 'Tokenize latex codes' do
      expect(
        Latexmath::Tokenizer.new(tex).tokenize.map(&:cat_code)
      ).to eq(
        [16,1,11,11,11,11,11,2,10,11,8,11,10,4,12,10,1,11,10,16,1,12,16,12,2,10,16,8,16,1,11,11,11,2,10,11,8,16,1,11,11,11,2,7,12,10,11,2,10,16,10,16,10,11,8,11,10,4,12,10,1,11,10,16,1,12,16,12,2,10,16,8,16,1,11,11,11,2,10,11,8,16,1,11,11,11,2,7,12,10,11,2,10,16,10,16,10,16,1,11,2,8,11,10,4,12,10,1,16,1,11,2,10,16,1,12,16,12,2,10,16,8,16,1,11,11,11,2,10,11,8,16,1,11,11,11,2,7,12,10,11,8,16,1,11,11,11,2,10,11,8,16,1,11,11,11,2,2,12,10,16,1,11,11,11,11,11,2]
      )
    end
  end
end
