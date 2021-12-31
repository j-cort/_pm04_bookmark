require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def self.create(email, password)
    return nil if email_exists?(email)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users (email, password) 
      VALUES ($1, $2)
      RETURNING id, email;", [email, encrypted_password]
    )
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.find(user_id)
    return nil unless user_id
    user_id = user_id.to_i
    p user_id
    result = DatabaseConnection.query(
      "SELECT id, email
      FROM users
      WHERE id = ($1)", [user_id]
    )
    p result
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.login(email, password)
    return nil unless email_exists?(email)
    return nil unless password_matches?(email, password)
    
    user_id = DatabaseConnection.query(
      "SELECT id
      FROM users
      WHERE email = ($1)", [email]
    ).first['id']
  end

  private

  def self.email_exists?(email)
    result = DatabaseConnection.query(
      "SELECT id, email
      FROM users
      WHERE email = ($1)", [email]
    ).first
    
  end

  def self.password_matches?(email, password)
    dbpass = DatabaseConnection.query(
      "SELECT password
      FROM users
      WHERE email = ($1)", [email]
    ).first['password']

    BCrypt::Password.new(dbpass) == password

  end


end

# class User < ActiveRecord::Base
#   # users.password_hash in the database is a :string
#   include BCrypt

#   def password
#     @password ||= Password.new(password_hash)
#   end

#   def password=(new_password)
#     @password = Password.create(new_password)
#     self.password_hash = @password
#   end
# end