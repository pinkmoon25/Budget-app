require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'tushar', email: 'tushar@mail.com', password: 'budget')
      sign_in @user
      @category = Category.create(author: @user, name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/512/2454/2454273.png')
      @total = @category.payments.sum(:amount)
      visit categories_path
    end

    it 'renders name of category' do
      expect(page).to have_content(@category.name)
    end

    it 'renders icon of the category' do
      expect(page).to have_css("img[src*='https://cdn-icons-png.flaticon.com/512/2454/2454273.png']")
    end

    it 'renders total transaction of the category' do
      expect(page).to have_content(@total)
    end

    it 'renders remove button' do
      expect(page).to have_content('remove')
    end

    it 'redirects to delete path' do
      click_button 'remove'
      expect(page).to have_current_path(categories_path)
    end

    it 'renders a button to add category' do
      expect(page).to have_content('Add Category')
    end

    it 'redirects to a form for new category' do
      click_link 'Add Category'
      expect(page).to have_current_path(new_category_path)
    end
  end
end
