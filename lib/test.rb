require 'json'
require 'nokogiri'
require 'httparty'

page = HTTParty.get('http://www.npr.org/programs/morning-edition/')

parse_page = Nokogiri::HTML(page)

song_title = []
artist = []

parse_page.css('.song-meta-wrap')

parse_page.css('.song-meta-wrap').map do |a|
  song_title.push(a.css('.song-meta-title'))
	artist.push(a.css('.song-meta-artist'))
end
puts song_title
puts artist
[song_title, artist]

# class Scrape
# 	def scrape_page

# 		page = HTTParty.get('http://www.npr.org/programs/morning-edition/')

# 		parse_page = Nokogiri::HTML(page)

# 		song_title = []
# 		artist = []

# 		parse_page.css('.song-meta-wrap')

# 		parse_page.css('.song-meta-wrap').map do |a|
# 			song_title.push(a.css('.song-meta-title'))
# 			artist.push(a.css('.song-meta-artist'))
# 		end
# 		puts song_title
# 		puts artist
# 		[song_title, artist]
# 	end
# end

# Scrape.new.scrape_page


# class Test

# 	def first_method
# 		@html_page = "first_method_string".inspect
# 	end

# 	def second_method
# 		@page = "=========#{@html_page.class.inspect}====="
# 	end

# end

# foo = Test.new
# puts foo.second_method
# puts foo.first_method