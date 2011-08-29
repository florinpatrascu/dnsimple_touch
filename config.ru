require './dnsimple_touch'
require './lib/dnsimple_api'
#set :environment, :production

DEBUG_ENABLED = false

run Sinatra::Application
