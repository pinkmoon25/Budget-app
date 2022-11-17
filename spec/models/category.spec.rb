require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.new(name: 'Test')
  end
  it 'requires a name attribute' do
    expect(Category.new).to_not be_valid
  end
  it 'requires a name attribute' do
    category = Category.new(name: 'Test', author: @user)
    expect(category).to_not be_valid
  end
  it 'requires a name attribute' do
    category = Category.new(name: 'Test', icon: 'url of icon', author: @user)
    expect(category).to be_valid
  end
end
