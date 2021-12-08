require 'pg'

class Bookmarks 
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    end
    table_connect = db_connect.exec('TABLE bookmarks') 
    table_connect.map { |bookmark| { id: bookmark['id'], name: bookmark['title'], link: bookmark['url'] }}
  end

  def self.display
    display = []
    self.all.each { | site |
      display << "<a href='#{site[:link]}'>#{site[:id]}. #{site[:name]}</a>"
    }
    display
  end

end



