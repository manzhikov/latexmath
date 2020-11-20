RSpec.describe Latexmath::Stomach do



  context 'Sample 3' do
    tex = 'G = {\\displaystyle \\frac{E}{2(1 + \\nu)}}'
    it 'Tokenize latex string' do
      tokens = Latexmath::Tokenizer.new(tex).tokenize
      expect(
        Latexmath::Stomach.new(tokens).to_math
      ).to eq(
<<~'INPUT'
<?xml version="1.0" encoding="UTF-8"?>
<math xmlns="http://www.w3.org/1998/Math/MathML" alttext="G={\displaystyle\frac{E}{2(1+\nu)}}" display="block">
  <mrow>
    <mi>G</mi>
    <mo>=</mo>
    <mfrac>
      <mi>E</mi>
      <mrow>
        <mn>2</mn>
        <mo>⁢</mo>
        <mrow>
          <mo stretchy="false">(</mo>
          <mrow>
            <mn>1</mn>
            <mo>+</mo>
            <mi>ν</mi>
          </mrow>
          <mo stretchy="false">)</mo>
        </mrow>
      </mrow>
    </mfrac>
  </mrow>
</math>
INPUT
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

end
