class MoviesController < ApplicationController

  require 'rest-client'
  require 'json'
  require 'byebug'

  # Search

  get '/fetch' do
    unless params[:title].blank? || (!params[:type].blank? && params[:type] != 'movie' &&  params[:type] != 'series' &&  params[:type] != 'episode')
      fetchData
    else
      redirect '/'
    end
    erb :'movie/search'
  end

  # Show all

  get '/' do
    @movies = Movie.all.order("id ASC")
    erb :'movie/index'
  end

  # Create a review

  post '/' do
    Movie.create(params[:movie])
    redirect '/movies'
  end

  # Find a review

  get '/:id' do
    @movie = Movie.find(params[:id])
    erb :'movie/show'
  end

  # Edit a review

  get '/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :'movie/edit'
  end

  #  Update a review

  put '/:id' do
    Movie.find(params[:id]).update(params[:movie])
    redirect '/movies'
  end

  # Delete a review

  delete '/:id' do
    Movie.find(params[:id]).delete
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

    if res["Response"] == "False"
      redirect '/'
    else
      @title = res["Search"][0]["Title"]
      @year = res["Search"][0]["Year"]
      @imdbID = res["Search"][0]["imdbID"]
      @type = res["Search"][0]["Type"]
      @posterURL = res["Search"][0]["Poster"]
      @alternatives = res["totalResults"].to_i - 1
    end
  end

end
