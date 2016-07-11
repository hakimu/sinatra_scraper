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

  def create_song
    songs = Song.new
    NprScraper.new.parse_song_title[0].each do |song|
      songs.song_title = song
    end
    NprScraper.new.parse_artist[0].each do |artist|
      songs.artist = artist
    end
    songs.created_at = DateTime.now
    songs.updated_at = DateTime.now
    songs.save
  end

end

DataMapper.finalize.auto_upgrade!
