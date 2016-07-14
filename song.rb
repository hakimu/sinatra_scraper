require 'json'
require './lib/scraper'
require 'pry'
require 'data_mapper'
require 'dm-sqlite-adapter'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/scraped_songs.db")

class Song

  include DataMapper::Resource
  property :id, Serial
  property :song_title, String
  property :artist, String
  property :created_at, DateTime
  property :updated_at, DateTime

  # def create_song
  #   songs = Song.new
  #   NprScraper.new.parse_song_title[0].each do |song|
  #     songs.song_title = song
  #   end
  #   NprScraper.new.parse_artist[0].each do |artist|
  #     songs.artist = artist
  #   end
  #   songs.created_at = DateTime.now
  #   songs.updated_at = DateTime.now
    

  #   # binding.pry
  #   songs.save
  # end

  def add_songs_to_database
    titles = NprScraper.new.parse_song_title[0]
    artists = NprScraper.new.parse_artist[0]
    titles.zip artists.each do |title,artist|
      song = Song.new
      song.song_title = title
      song.artist = artist
      song.created_at = DateTime.now
      song.updated_at = DateTime.now
      song.save
    end
  end

end

DataMapper.finalize.auto_upgrade!
