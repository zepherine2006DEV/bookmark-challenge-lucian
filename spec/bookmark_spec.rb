require 'bookmark'

describe Bookmark do
  describe "all" do
    it'should return an array of bookmarks' do

      Bookmark.create(url: 'http://www.makersacademy.com')
      Bookmark.create(url: 'http://www.google.com')
      Bookmark.create(url: 'http://destroyallsoftware.com')
      expect(Bookmark.all).to eq [
        'http://www.makersacademy.com',
        'http://www.google.com',
        'http://destroyallsoftware.com'
        ]
    end
  end
  describe "create" do
    it 'should create a new bookmark' do
      Bookmark.create(url: "www.telegraph.co.uk")
      expect(Bookmark.all).to include("www.telegraph.co.uk")
    end
  end
end
