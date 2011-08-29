require 'sinatra'
# require 'sinatra/static_assets' #not yet ;)
require "rack-flash"
require "json"
require 'dnsimple' #must have the dnsimple-ruby gem installed


set :run, false # disable built-in sinatra web server
set :environment, :development
#set :base_url, 'http://dnsimple-touch.simplegames.ca' # custom application option

set :logging, true
set :dump_errors, false

enable :static
#enable :sessions, if you need to store less than 4K in the session
# for this test I'll store more than 4k and I'll use the Rack for that. 
use Rack::Session::Pool
# do we want Cookie sessions?
# use Rack::Session::Cookie, :key => 'sessionwürst',
#                            :domain => 'simplegames.ca',
#                            :path => '/',
#                            :expire_after => 2592000, # In seconds
#                            :secret => 'XOXOXOXO'
use Rack::Flash, :sweep => true  # see: https://github.com/nakajima/rack-flash

helpers do
  # check if a mobile device:
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end  
end

# making sure we have access to the DNSimpleAPI in all our pages
before do
  if session[ :dnsimple].nil?
    session[ :dnsimple] = DNSimpleAPI.new
  end

  @dnsimple = session[ :dnsimple]
end

get '/' do
  content_type 'text/html; charset=utf-8'
  haml :index
end

get '/home' do
  haml :home
end

get '/templates' do
  begin
    @templates = @dnsimple.templates( :all, {:type=>"Service"})
  rescue Exception => e
    flash[:error] = e
  end
  
  haml :templates
end

get '/domains' do
  begin
    @domains = @dnsimple.domains
  rescue Exception => e
    flash[:error] = e
  end
  
  haml :domains
end

get '/contacts' do
  begin
    @contacts = @dnsimple.contacts
  rescue Exception => e
    flash[:info] = e
  end
  
  haml :contacts
end

get '/about' do
  haml :about
end

get '/account' do
  @dnsimple_user = @dnsimple.user
  haml :account
end

get '/login' do
  haml :login
end

post '/logout' do
  @dnsimple.logout
  haml :home
end

post '/sign-in' do
  unless params[:email].empty? && params[:password].empty?
    # t1 = Thread.new{
        # sleep 3
        # Actually authorize the user with DNSimple API.
        begin
          @dnsimple.login( params[ :email], params[ :password])
        rescue Exception => e
          flash[:info] = "Check your username or password"
        end
        
    # }
    # t1.join
    if @dnsimple.logged_in?
      # todo Greet the user with a temporary floaty
      haml :home
    else
      haml :login
    end

  else
    flash[:info] = "Invalid credentials"
    haml :login
  end  
end

#page for testing large result sets rendering
get '/:page' do
  @page = params[:page]
  @items = 100.times.map {|n| [@page, n].join(" ")}
  haml :list
end


