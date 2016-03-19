class HomeController < ApplicationController

  require 'rest-client'
  require 'json'

  get '/' do
    erb :'home'
  end

  # get '/fetch' do
  #   res = JSON.parse( RestClient.get 'www.omdbapi.com/', { params: { s: params[:title], tomatoes: true, y: params[:year], type: params[:type] }} )
  #   byebug
  #   @title = res["Search"][0]["Title"]
  #   @year = res["Search"][0]["Year"]
  #   @imdbID = res["Search"][0]["imdbID"]
  #   @type = res["Search"][0]["Type"]
  #   @posterURL = res["Search"][0]["Poster"]
  #   @alternatives = res["totalResults"].to_i - 1
  #   # byebug
  #   erb :'movie/index'
  # end

end
