# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer" do
        result = number_to_currency(400)
        expect(result).to eq('$400.00')
      end
      
      it "correctly formats a float" do
        result = number_to_currency(400.45)
        expect(result).to eq('$400.45')
      end

      it "correctly formats a string" do
        result = number_to_currency('400.45')
        expect(result).to eq('$400.45')
      end
      
      it "uses delimiters for very large numbers" do
        result = number_to_currency(45000.25)
        expect(result).to eq('$45,000.25')
      end

      it "does not have delimiters for small numbers" do
        result = number_to_currency(45)
        expect(result).to eq('$45.00')
      end

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit' do
        result = number_to_currency(400, { unit: 'Ksh'})
        expect(result).to eq('Ksh400.00')
      end

      it 'allows changing the :precision' do
        result = number_to_currency(500, { precision: 3 })
        expect(result).to eq('$500.000')
      end
      
      it 'omits the separator if :precision is 0' do
        result = number_to_currency(49000, { precision: 0 })
        expect(result).to eq('$49,000')
      end
      
      it 'allows changing the :delimiter' do
        result = number_to_currency(254000, { delimiter: '#' })
        expect(result).to eq('$254#000.00')
      end
      
      it 'allows changing the :separator' do
        result = number_to_currency(1298, { separator: '#' })
        expect(result).to eq('$1,298#00')
      end
            
      it 'correctly formats using multiple options' do
        result = number_to_currency(23000, { precision: 3, delimiter: '.', unit: 'Ksh' })
        expect(result).to eq('Ksh23.000.000')
      end
      
    end
    
  end
  
end
