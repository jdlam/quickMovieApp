class HomeController < ApplicationController

  require 'rest-client'
  require 'json'

  get '/' do
    erb :'home'
  end

end
