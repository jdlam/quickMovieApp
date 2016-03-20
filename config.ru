require './app'

run Sinatra::Application


# Models
require './models/movie'

# Controllers
require './controllers/application_controller'
require './controllers/home_controller'
require './controllers/movies_controller'

# Routes
map('/'){ run HomeController }
map('/movies'){ run MoviesController }
