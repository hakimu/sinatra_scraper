require 'json'
require 'nokogiri'
require 'httparty'
require './lib/scraper'
require 'shotgun'
require 'pry'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'sinatra'
require 'newrelic_rpm'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/scraped_songs.db")

class Song

  include DataMapper::Resource
  property :id, Serial
  property :song_title, String
  property :artist, String
  property :created_at, DateTime
  property :updated_at, DateTime

end

DataMapper.finalize.auto_upgrade!

class NprBump < Sinatra::Base

	get '/' do
    @artist = NprScraper.new.parse_artist
    @title = NprScraper.new.parse_song_title
    @stuff = Song.all
		erb :index
	end

	post '/' do
		test = Song.new
		test.song_title = "The Root"
		test.artist = "D'Angelo"
		test.created_at = Time.now
		test.updated_at = Time.now
		test.save
		redirect '/'
	end

end



