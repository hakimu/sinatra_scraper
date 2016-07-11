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




