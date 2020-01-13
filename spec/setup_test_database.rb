require 'pg'

p 'Setting up test database'

connection = PG.connect(dbname: 'bookmark_manager_test')

#clears the bmrk table

connection.exec("TRUNCATE bookmarks;")
