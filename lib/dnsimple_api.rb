require "dnsimple"
# quick DNSimple bridge prototype
# - the user authentication is delegated to the DNSimple authority

class DNSimpleAPI  
  attr_accessor :username, :password
  attr_reader :user
   
  def initialize( username =nil, password=nil)
    @username = username
    @password = password
  end
  
  def logout
    DNSimple::Client.username = nil
    DNSimple::Client.password = nil
    @user = @username = @password = nil
  end
  
  def login( username =nil, password=nil)
    @username = username
    @password = password

    DNSimple::Client.username = username
    DNSimple::Client.password = password 
    DNSimple::Client.base_uri = "http://test.dnsimple.com"
    DNSimple::Client.debug = DEBUG_ENABLED
    @user = DNSimple::User.me
  end
  
  def logged_in?
    not @user.nil?
  end 

  def domains( id =nil)
    if id.nil?
      DNSimple::Domain.all      
    else
      DNSimple::Domain.find( id)
    end
  end 
  
  def contacts( id =nil)
    if id.nil?
      DNSimple::Contact.all      
    else
      DNSimple::Contact.find( id)
    end 
  end 
  
  # accesing the "system templates" aka Services
  # as well as user specific. (todo)
  # returning now the "system templates"  
  def templates( id =nil, options={})
    if id.nil? || id === :all
      DNSimple::Service.all
    else
      DNSimple::Service.find( id)
    end 
  end 
  
end
