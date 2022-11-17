require 'rails_helper'

RSpec.describe 'Payments', type: :feature do
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'tushar', email: 'tushar@mail.com', password: 'budget')
      sign_in @user
      @category = Category.create(author: @user, name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/512/2454/2454273.png')
      @payment = Payment.create(author: @user, name: 'Burger', amount: 50)
      @category.payments << @payment
      @payment.categories << @category
      @total = @category.payments.sum(:amount)
      visit category_path(@category.id)
    end

    it 'renders name of Payment' do
      expect(page).to have_content(@payment.name)
    end

    it 'renders total transaction of the category' do
      expect(page).to have_content(@total)
    end

    it 'renders amount of transaction' do
      expect(page).to have_content(@payment.amount)
    end

    it 'renders a button to add transaction' do
      expect(page).to have_content('Add Transaction')
    end

    it 'redirects to a form for new transaction' do
      click_link 'Add Transaction'
      expect(page).to have_current_path(new_category_payment_path(@category.id))
    end
  end
end
