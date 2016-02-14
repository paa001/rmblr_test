require 'rails_helper'

feature 'authorized user visit to admin panel' do
  before do
    @user = create(:user)
    login_as @user, scope: :user
  end

  scenario 'and admin root path should be available' do
    visit admin_root_path
    expect(page).to have_content('Translations')
  end

  scenario 'and can create translation' do
    visit admin_root_path
    click_link('create new')
    fill_in('translation_name', with: 'translation#1')
    click_button 'Create'

    expect(page).to have_content('translation#1')
  end

  scenario 'and can create translation message' do
    translation = create :translation

    visit admin_translation_path(translation)
    fill_in('translation_message_body', with: 'message#1')
    click_button 'post'

    expect(page).to have_content('message#1')
    expect(page).to have_content(@user.name)
  end

  scenario 'and don\'t can create blank translation message' do
    translation = create :translation
    create :translation_message, translation: translation

    visit admin_translation_path(translation)
    fill_in('translation_message_body', with: '')
    click_button 'post'

    expect(page).to have_selector('li', count: 1)
  end
end
