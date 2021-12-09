require 'bookmarks'

describe Bookmarks do
let(:bookmarks) { described_class.display }    

  describe '#display' do
    it 'returns a list of bookmakrs' do
      expect(bookmarks[0]).to include "<a href='http://www.makersacademy.com'>1. makers</a>"
      expect(bookmarks[1]).to include "<a href='http://www.destroyallsoftware.com'>2. destroyallsoftware</a>"
      expect(bookmarks[2]).to include "<a href='http://www.google.com'>3. google</a>"
    end
  end

  describe '#add' do  
    it 'adds a new bookmark' do
      Bookmarks.add('https://www.codecademy.com/', 'codecademy')
      expect(bookmarks[3]).to include "<a href='https://www.codecademy.com/'>4. codecademy</a>"
    end
  end

  describe '#delete' do  
    it 'deletes a bookmark by id' do
      Bookmarks.delete(1)
      expect(bookmarks[0]).to include "<a href='http://www.destroyallsoftware.com'>2. destroyallsoftware</a>"
      expect(bookmarks[0]).not_to include "<a href='http://www.makersacademy.com'>1. makers</a>"
    end
  end

end