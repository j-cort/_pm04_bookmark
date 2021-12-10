require 'bookmarks'

describe Bookmarks do
let(:bookmarks) { described_class.all }   

  describe '#all' do
    it 'returns an array of Bookmarks objects' do
      expect(bookmarks.count).to eq 3
      expect(bookmarks[0]).to be_an_instance_of Bookmarks
      expect(bookmarks[1].id).to eq '2'
      expect(bookmarks[2].url).to eq 'http://www.google.com'
      expect(bookmarks[0].title).to eq 'makers'
    end
  end

  describe '#add' do  
    it 'adds a new bookmark' do
      Bookmarks.add('https://www.codecademy.com/', 'codecademy')
      expect(bookmarks[3].id).to eq '4'
      expect(bookmarks[3].url).to eq 'https://www.codecademy.com/'
      expect(bookmarks[3].title).to eq 'codecademy'
    end
  end

  describe '#delete' do  
    it 'deletes a bookmark by id' do
      Bookmarks.delete(1)
      expect(bookmarks[0].id).to eq '2'
      expect(bookmarks[0].id).not_to eq '1'
      expect(bookmarks[0].url).to eq 'http://www.destroyallsoftware.com'
      expect(bookmarks[0].url).not_to eq 'http://www.makersacademy.com'
      expect(bookmarks[0].title).to eq 'destroyallsoftware'
      expect(bookmarks[0].title).not_to eq 'makers'
    end
  end

  describe '#edit' do  
    it 'edits a bookmark by id' do
      Bookmarks.edit(1, 'http://www.bakersacademy.com', 'bakers')
      expect(bookmarks[0].url).to eq 'http://www.bakersacademy.com'
      expect(bookmarks[0].url).not_to eq 'http://www.makersacademy.com'
      expect(bookmarks[0].title).to eq 'bakers'
      expect(bookmarks[0].title).not_to eq 'makers'
      
    end
  end

end