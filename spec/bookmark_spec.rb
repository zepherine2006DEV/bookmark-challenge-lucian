require 'bookmark'

describe Bookmark do
  describe "all" do
    it'should return an array of bookmarks' do
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark-manager')
      end

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
      expect(Bookmark.all).to eq [
        'http://www.makersacademy.com',
        'http://www.google.com',
        'http://destroyallsoftware.com'
        ]
    end
  end
end
