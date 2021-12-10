require 'pg'

class Bookmarks
  attr_reader :id, :url, :title
  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager')
    end
    table_connect = db_connect.exec('TABLE bookmarks ORDER BY id ASC') 
    # table_connect.map { |bookmark| { id: bookmark['id'], title: bookmark['title'], url: bookmark['url'] }}
    table_connect.map { |bookmark| Bookmarks.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def display
    "<a class='bm-link' href='#{@url}'>#{@title}</a>"
  end

  def delete_button
     "<form class='#{@title} bm-delete-button' action='/delete_bookmark' method='post'>
        <input type='hidden' name='to_delete' value='#{@id}'>
        <button type='submit' value='Delete'><i class='fas fa-trash-alt fa-5x'></i></button>
      </form>"    
  end

  def edit_button
    "<div class='#{@title} bm-edit-button'>
      <button type='submit' value='Edit'><i class='fas fa-edit fa-5x'></i></button>
    </div>" 
  end

  def edit_form
    "<form class='#{@title} bm-edit-form' action='/edit_bookmark' method='post'>
      <input type='hidden' name='to_edit' value='#{@id}'>
      <input type='text' name='new_url' placeholder='#{@url}'>
      <input type='text' name='new_title' placeholder='#{@title}'>
      <input type='submit' value='Edit'> 
    </form>" 
  end

  def self.display
    display = []
    self.all.each { | site |
      display << ["<a href='#{site[:url]}'>#{site[:id]}. #{site[:title]}</a>",
      "<form action='/delete_bookmark' method='post' class='#{site[:title]} delete' style='display:inline;'>
      <input type='hidden' name='to_delete' value='#{site[:id]}'>
      <input type='submit' value='Delete'>
      </form>",
      "<form action='/edit_bookmark' method='post' class='#{site[:title]} edit'>
      <input type='hidden' name='to_edit' value='#{site[:id]}'>
      <input type='text' name='new_url' placeholder='#{site[:url]}'>
      <input type='text' name='new_title' placeholder='#{site[:title]}'>
      <input type='submit' value='Edit'>
      </form>"]
     
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
    db_connect.exec_params("DELETE FROM bookmarks WHERE id = ($1)", [id])
  end

  def self.edit(id, new_url, new_title)
    if ENV['ENVIRONMENT'] == 'test'
      db_connect = PG.connect(dbname: 'bookmark_manager_test')
    else 
      db_connect = PG.connect(dbname: 'bookmark_manager')
    end
    db_connect.exec("UPDATE bookmarks SET url = '#{new_url}', title = '#{new_title}' WHERE id = #{id}")
    # Change above to exec_params
  end

end
