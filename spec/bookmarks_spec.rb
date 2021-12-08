require 'bookmarks'

describe Bookmarks do
let(:bookmarks) { described_class.display }
  
  describe '#display' do
    
    it 'returns a list of bookmakrs' do
      #Connect to db
      db_connect = PG.connect(dbname: 'bookmark_manager_test') 
      
      # Add the test data to table
      db_connect.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
      db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'twitter');")
      db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")

      expect(bookmarks).to include "<a href='http://www.makersacademy.com/'>1. makers</a>"
      expect(bookmarks).to include "<a href='http://www.destroyallsoftware.com'>2. twitter</a>"
      expect(bookmarks).to include "<a href='http://www.google.com/'>3. google</a>"
    end

  end

end