feature 'Comment functionality' do
  feature 'User can add comment on a bookmark and then view it on the page' do
    scenario 'User adds comment to a bookmark' do
      bookmark = Bookmark.create(url: 'http:://www.JakesProteinShakes.com', title: 'Gains')

      visit '/bookmarks'
      first('.bookmark').click_button 'Comment'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'Comment', with: 'For getting big'
      click_button 'Submit'

      expect(current_path).to eq '/bookmark'
      expect(first('.bookmark')).to have_content 'test'
    end
  end
end
