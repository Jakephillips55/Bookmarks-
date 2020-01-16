
feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'The bookmarks must be a valid URL' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'TEST INCORRECT URL'
    click_button 'Submit'

    expect(page).not_to have_content 'TEST INCORRECT URL'
    expect(page).to have_content 'INCORRECT URL'
  end
end
