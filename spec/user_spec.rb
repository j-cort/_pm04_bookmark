require 'database_helpers'

describe '#create' do
  it 'creates a new user' do
    user = User.create('test@example.com', 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(email: 'test@example.com', password: 'password123')
    end

end