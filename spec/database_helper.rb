require 'pg'

def empty_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks")
end