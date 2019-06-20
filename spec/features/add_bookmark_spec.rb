# As a user,
# So that i can revisit this website before,
# I would like to add it to my bookmarks list.

feature 'Add bookmarks' do
  context 'Database is empty' do
    scenario 'Should add new bookmark When form is submitted' do
      visit('/bookmarks/new')
      fill_in('url', with: "www.lucian.com")
      click_button('Add')
      expect(page).to have_content "www.lucian.com"
    end
  end
end