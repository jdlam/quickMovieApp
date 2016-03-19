require './app'

run Sinatra::Application


# Models
require './models/movie'

# Controllers
require './controllers/application_controller'
require './controllers/home_controller'
require './controllers/movies_controller'
require './controllers/api/movies_api_controller'

# Routes
map('/'){ run HomeController }
map('/movies'){ run MoviesController }
map('/api'){ run MoviesApiController }
