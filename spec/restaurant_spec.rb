require 'restaurant'

describe Restaurant do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  # let(:crescent) { Restaurant.new(:name => 'Crescent', :cuisine => 'paleo', :price => '321') }
  
  describe 'attributes' do

    let(:restaurant) { Restaurant.new }
  
    it "allow reading and writing for :name" do
      restaurant.name = 'CJs'
      expect(restaurant.name).to eq('CJs')
    end

    it "allow reading and writing for :cuisine" do
      restaurant.cuisine = 'ribs'
      expect(restaurant.cuisine).to eq('ribs')
    end

    it "allow reading and writing for :price" do
      restaurant.price = 45
      expect(restaurant.price).to eq(45)
    end
    
  end
  
  # describe '.load_file' do

  #   it 'does not set @@file if filepath is nil' do
  #     no_output { Restaurant.load_file(nil) }
  #     expect(Restaurant.file).to be_nil
  #   end
    
  #   it 'sets @@file if filepath is usable' do
  #     no_output { Restaurant.load_file(test_file) }
  #     expect(Restaurant.file).not_to be_nil
  #     expect(Restaurant.file.class).to be(RestaurantFile)
  #     expect(Restaurant.file).to be_usable
  #   end

  #   it 'outputs a message if filepath is not usable' do
  #     expect do
  #       Restaurant.load_file(nil)
  #     end.to output(/not usable/).to_stdout
  #   end
    
  #   it 'does not output a message if filepath is usable' do
  #     expect do
  #       Restaurant.load_file(test_file)
  #     end.not_to output.to_stdout
  #   end
    
  # end
  
  # describe '.all' do
    
  #   it 'returns array of restaurant objects from @@file' do
  #     pending
  #     Restaurant.load_file(test_file)
  #     restaurants = Restaurant.all
  #     expect(restaurants.class).to eq(Array)
  #     expect(restaurants.length).to eq(6)
  #     expect(restaurants.first.class).to eq(Restaurant)
  #   end

  #   it 'returns an empty array when @@file is nil' do
  #     pending
  #     no_output { Restaurant.load_file(nil) }
  #     restaurants = Restaurant.all
  #     expect(restaurants).to eq([])
  #   end
    
  # end
  
  describe '#initialize' do

    context 'with no options' do
      # subject would return the same thing
      let(:no_options) { Restaurant.new }

      it 'sets a default of "" for :name' do
        expect(no_options.name).to eq('')
      end

      it 'sets a default of "unknown" for :cuisine' do
        expect(no_options.cuisine).to eq('unknown')
      end

      it 'does not set a default for :price' do
        expect(no_options.price).to be_nil
      end
    end
    
    context 'with custom options' do

      let(:with_options) { Restaurant.new({ name: 'CJs', cuisine: 'ribs', price: 45}) }
      
      it 'allows setting the :name' do
        expect(with_options.name).to eq('CJs')
      end

      it 'allows setting the :cuisine' do
        expect(with_options.cuisine).to eq('ribs')
      end

      it 'allows setting the :price' do
        expect(with_options.price).to eq(45)
      end

    end

  end
  
  describe '#save' do

    let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
    
    it 'returns false if @@file is nil' do
      allow(Restaurant).to receive(:file).and_return(:nil)

      restaurant = Restaurant.new
      expect(restaurant.save).to be false
    end
    
    it 'returns false if not valid' do
      restaurant = Restaurant.new()
      expect(restaurant.valid?).to be false
    end
    
    it 'calls append on @@file if valid' do
      Restaurant.load_file(test_file)
      restaurant = Restaurant.new({ name: 'CJs', cuisine: 'ribs', price: 45})
      allow(Restaurant.file).to receive(:append)
      restaurant.save
      expect(Restaurant.file).to have_received(:append)
    end
    
  end
  
  describe '#valid?' do

    let(:restaurant) { Restaurant.new({ name: 'CJs', cuisine: 'ribs', price: 45}) }
    
    it 'returns false if name is nil' do
      restaurant.name = nil
      expect(restaurant.valid?).to be false
    end

    it 'returns false if name is blank' do
      restaurant.name = ''
      expect(restaurant.valid?).to be false
    end

    it 'returns false if cuisine is nil' do
      restaurant.cuisine = nil
      expect(restaurant.valid?).to be false
    end

    it 'returns false if cuisine is blank' do
      restaurant.cuisine = ''
      expect(restaurant.valid?).to be false
    end
    
    it 'returns false if price is nil' do
      restaurant.price = nil
      expect(restaurant.valid?).to be false
    end

    it 'returns false if price is 0' do
      restaurant.price = 0
      expect(restaurant.valid?).to be false
    end
    
    it 'returns false if price is negative' do
      restaurant.price = -1
      expect(restaurant.valid?).to be false
    end

    it 'returns true if name, cuisine, price are present' do
      expect(restaurant.valid?).to be true
    end
    
  end

end
