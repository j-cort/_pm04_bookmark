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
      display << ["<a href='#{site[:url]}'>#{site[:id]}. #{site[:title]}</a>",
      "<form action='/delete_bookmark' method='post' style='display:inline;'>
      <input type='hidden' name='to_delete' value='#{site[:id]}'>
      <input type='submit' value='Delete #{site[:title]}'>
      </form>"]
      # <form action='/edit_bookmark' method='post'>
      # <input type='hidden' name='to_delete' value='#{site[:id]}'>
      # <input type='submit' value='Edit #{site[:title]}'>
      # </form>
    }
    display
  end

  def self.add(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager')
    end
    db_connect.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2)", [url, title])
  end

  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager')
    end
    db_connect.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

end
