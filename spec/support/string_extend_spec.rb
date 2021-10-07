describe 'String' do

  describe "#titleize" do

    it "capitalizes each word in a string" do
      str = 'hello world'
      expect(str.titleize).to eq('Hello World')
    end
    
    it "works with single-word strings" do
      str = 'hello'
      expect(str.titleize).to eq('Hello')
    end
    
    it "capitalizes all uppercase strings" do
      str = 'HELLO WORLD'
      expect(str.titleize).to eq('Hello World')
    end
    
    it "capitalizes mixed-case strings" do
      str = 'hEllO wORLd'
      expect(str.titleize).to eq('Hello World')
    end
    
  end
  
  describe '#blank?' do

    it "returns true if string is empty" do
      str = ""
      expect(str.blank?).to be true
    end

    it "returns true if string contains only spaces" do
      str = '    '
      expect(str.blank?).to be true
    end

    it "returns true if string contains only tabs" do
      # Get a tab using a double-quoted string with \t
      # example: "\t\t\t"
      str = "\t\t\t"
      expect(str.blank?).to be true
    end

    it "returns true if string contains only spaces and tabs" do
      str = "    \t\t\t   "
      expect(str.blank?).to be true
    end
    
    it "returns false if string contains a letter" do
      str = 'f'
      expect(str.blank?).to be false
    end

    it "returns false if string contains a number" do
      str = '5'
      expect(str.blank?).to be false
    end
    
  end
  
end
