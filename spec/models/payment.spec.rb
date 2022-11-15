require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.new(name: 'Test')
  end
  it 'requires a name attribute' do
    expect(Payment.new).to_not be_valid
  end
  it 'requires a name attribute' do
    payment = Payment.new(name: 'Test', author: @user)
    expect(payment).to_not be_valid
  end
  it 'requires a name attribute' do
    payment = Payment.new(name: 'Test', amount: 'string', author: @user)
    expect(payment).to_not be_valid
  end
  it 'requires a name attribute' do
    payment = Payment.new(name: 'Test', amount: 100, author: @user)
    expect(payment).to be_valid
  end
end
