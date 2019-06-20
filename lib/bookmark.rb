require 'pg'

class Bookmark 
  def self.all
    output_array = []
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark-manager')
    end

      connection.exec("SELECT * FROM bookmarks") do |result|
      result.each do |row| # iterate over the rows in the result
        output_array << row["url"] # push each url into an array
      end
    end
    output_array
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark-manager')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
  end
end
