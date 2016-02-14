require 'rails_helper'

feature 'not authorized user visit to admin panel' do
  scenario ' admin root path shouldn\'t be available' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end
end

feature 'not authorized user visit to translations' do
  scenario 'and it should be available' do
    visit translations_path
    expect(page).to have_content('Translations')
  end

  scenario 'and see translations list' do
    translation1 = create :translation
    translation2 = create :translation

    visit translations_path

    expect(page).to have_content(translation1.name)
    expect(page).to have_content(translation2.name)
  end

  scenario 'and watch to translation' do
    translation = create :translation
    message1 = create :translation_message, translation: translation
    message2 = create :translation_message, translation: translation

    visit translation_path(translation)

    expect(page).to have_content(message1.body)
    expect(page).to have_content(message2.body)
  end
end
