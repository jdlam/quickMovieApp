require '../app'

run Sinatra::Application


# Models
require '../models/comment'

# Controllers
require '../controllers/application_controller'
require '../controllers/home_controller'
require '../controllers/comment_controller'
require '../controllers/api/movie_api_controller'

# Routes
map('/'){ run HomeController }
map('/api'){ run MovieApiController }
