require 'pg'
require_relative 'database_connection'
require 'uri'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    bookmarks = DatabaseConnection.query("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark| bookmark }
    bookmarks.map { |bookmark|
      Bookmark.new(
        url: bookmark['url'],
        title: bookmark['title'],
        id: bookmark['id'])
    }
  end



  def self.create(url:, title: )
    return false unless is_url?(url)

    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'],
      title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title ='#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
   result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
   Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def comment
    DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{id};")
  end
  
  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https' ])}\z/
  end
end
