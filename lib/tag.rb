require 'pg'
require_relative 'database_connection'

class Tag
  attr_reader :id, :content, :bookmark_id

  def initialize(id, content, bookmark_id)
    @id = id
    @content = content
    @bookmark_id = bookmark_id
  end

  def self.all_tags
    table = DatabaseConnection.query('TABLE tags ORDER BY id ASC') 
    table.map { |tag| Tag.new(tag['id'], tag['content'], tag['bookmark_id']) }
  end

  def display_tag
    "<p class='bm-tag'>#{@content}</p>"
  end

  def self.add_tag(content, bookmark_id) 
    DatabaseConnection.query("INSERT INTO tags (content, bookmark_id) VALUES ($1, $2)", [content, bookmark_id])
  end

  def self.delete_tag(tag_id)
      DatabaseConnection.query("DELETE FROM tags WHERE id = ($1)", [tag_id])
  end

  def delete_button
    "<form id='bm-tag-#{@id}-delete-button' class='bm-tag-delete-button' action='/delete_bookmark_tag' method='post'>
      <input type='hidden' name='tag_id' value='#{@id}'> 
      <button type='submit' value='Delete'><i class='fas fa-times-circle'></i></button>
    </form>"   
  end

end