require 'pg'

class Bookmarks 
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager')
    end
    table_connect = db_connect.exec('TABLE bookmarks') 
    table_connect.map { |bookmark| { id: bookmark['id'], title: bookmark['title'], url: bookmark['url'] }}
  end

  def self.display
    display = []
    self.all.each { | site |
      display << "<a href='#{site[:url]}'>#{site[:id]}. #{site[:title]}</a>"
    }
    display
  end

  def self.add_new(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager')
    end
    db_connect.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

end
