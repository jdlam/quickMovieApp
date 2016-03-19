class MoviesApiController < ApplicationController

  require 'rest-client'
  require 'json'
  require 'byebug'

  get '/fetch' do
    unless params[:title].blank? || (!params[:type].blank? && params[:type] != 'movie' &&  params[:type] != 'series' &&  params[:type] != 'episode')
      fetchData
    else
      redirect '/'
    end
    erb :'movie/search'
  end

  post '/' do
    Movie.create(params[:movie])
    redirect '/movies'
  end

  private

  def fetchData
    obj = { s: params[:title], tomatoes: true }
    unless params[:year].blank?
      obj.merge!(y: params[:year].to_i)
    end
    unless params[:type].blank?
      obj.merge!(type: params[:type])
    end
    res = JSON.parse( RestClient.get 'www.omdbapi.com/', { params: obj} )

    @title = res["Search"][0]["Title"]
    @year = res["Search"][0]["Year"]
    @imdbID = res["Search"][0]["imdbID"]
    @type = res["Search"][0]["Type"]
    @posterURL = res["Search"][0]["Poster"]
    @alternatives = res["totalResults"].to_i - 1
    # byebug
  end

end
