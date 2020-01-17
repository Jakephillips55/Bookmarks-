require 'pg'

p 'Setting up test database'
def setup_test_database

connection = PG.connect(dbname: 'bookmark_manager_test')

#clears the bmrk table

#connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));")

connection.exec("TRUNCATE bookmarks, comments;")

end
