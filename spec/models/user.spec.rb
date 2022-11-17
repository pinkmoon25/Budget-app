require 'rails_helper'

RSpec.describe User, type: :model do
  it 'requires a name attribute' do
    expect(User.new).to_not be_valid
  end
  it 'requires a name attribute' do
    user = User.new(name: 'Test', email: 'tushar@mail.com', password: 'budget')
    expect(user).to be_valid
  end
end
