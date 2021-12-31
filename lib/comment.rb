require 'pg'
require_relative 'database_connection'

class Comment
  attr_reader :id, :text, :bookmark_id

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.all_comments
    table = DatabaseConnection.query('TABLE comments ORDER BY id ASC') 
    table.map { |comment| Comment.new(comment['id'], comment['text'], comment['bookmark_id']) }
  end

  def self.add_comment(text, bookmark_id)
    DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES ($1, $2)", [text, bookmark_id])
  end

  def self.delete_comment(comment_id)
    DatabaseConnection.query("DELETE FROM comments WHERE id = ($1)", [comment_id])
  end

  def display_comment
    "<p class='bm-comment'>\"#{@text}\"</p>"
  end

  def delete_button
    "<form id='bm-comment-#{@id}-delete-button' class='bm-comment-delete-button' action='/delete_bookmark_commment' method='post'>
      <input type='hidden' name='comment_id' value='#{@id}'>
      <button type='submit' value='Delete'><i class='fas fa-trash-alt'></i></button>
    </form>"   
  end

end