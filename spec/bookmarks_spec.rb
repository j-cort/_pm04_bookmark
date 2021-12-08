require 'bookmarks'

describe Bookmarks do
let(:bookmarks) { described_class.display }    

  describe '#display' do
    it 'returns a list of bookmakrs' do
      expect(bookmarks).to include "<a href='http://www.makersacademy.com'>1. makers</a>"
      expect(bookmarks).to include "<a href='http://www.destroyallsoftware.com'>2. destroyallsoftware</a>"
      expect(bookmarks).to include "<a href='http://www.google.com'>3. google</a>"
    end
  end

  describe '#add' do  
    it 'adds a new bookmark' do
      Bookmarks.add_new('https://www.codecademy.com/', 'codecademy')
      expect(bookmarks).to include "<a href='https://www.codecademy.com/'>4. codecademy</a>"
    end
  end

end