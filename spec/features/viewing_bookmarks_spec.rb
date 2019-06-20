# As a user,
# so that I can access websites I marked
# I would like to see a list of bookmarks

feature 'Viewing bookmarks' do
  scenario 'user can view a basic welcome page' do
    visit '/bookmarks'
    expect(page).to have_content "Bookmark Manager"
   end

   scenario 'user can view a list of bookmarks' do
     if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
     else
      connection = PG.connect(dbname: 'bookmark-manager')
     end

     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
     visit '/bookmarks'
     expect(page).to have_content "http://www.makersacademy.com"
     expect(page).to have_content "http://www.google.com"
     expect(page).to have_content "http://destroyallsoftware.com"
   end
end
