# DNSimple - jQTouch prototype

This is a very basic Sinatra web application I wrote for fun, testing and learning more about [jQTouch](http://jqtouch.com/) for mobile phones. Being familiar with the [DNSimple REST API](https://dnsimple.com/documentation/api), I thought this was a nice opportunity to transform the command line support, accessible through the [dnsimple-ruby gem](http://github.com/aetrion/dnsimple-ruby), into a proxy for accessing DNSimple from a web interface and use it as a simple service back-end. The recommended way for connecting to the DNSimple services, is through their public API.

# Ingredients
* [DNSimple Ruby client](http://github.com/aetrion/dnsimple-ruby)
* [jQTouch](http://jqtouch.com/)
* [jQuery](http://jquery.com/)
* [Sinatra](http://www.sinatrarb.com/)
* [Thin](http://code.macournoyer.com/thin/)
* [HAML](http://haml-lang.com/)
* [Ruby](http://www.ruby-lang.org/en/), of course ;)

# Getting started
    
    $ git clone git@github.com:florinpatrascu/dnsimple_touch.git
    $ cd dnsimple_touch
    $ bundle install
    $ thin start 

The Thin server will start on port 3000 (default) and you can access the app at:

    http://localhost:3000
    
You can change the port by running Thin like this:

    $ thin start -p 8080

You can test the interface within your web browser or if you have the [iPhone SDK](http://developer.apple.com/devcenter/ios/index.action) you can also browse it from Apple's iPhone simulator that you will find it here:

    /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/

Or you can use [iPhoney](http://marketcircle.com/iphoney/), as a viable alternative.

You should be able to see this screen from your simulator (spoiler alert):

![demo screenshot](https://github.com/florinpatrascu/dnsimple_touch/raw/master/public/images/dnsimple_touch_home_screen_preview.png)


# Noteworthy
* not exploring the complete feature set of the DNSimple, visit [DNSimple](https://dnsimple.com) for a complete list of features and services
* this application is using the [test](http://test.dnsimple.com) version of DNSimple
* for being able to play and test your own DNSimple app, you'll need to register first with [test.dnsimple.com](http://test.dnsimple.com)
* [DNSimple](https://dnsimple.com/about) is provided by AETRION LLC.
* This demo is not endorsed by DNSimple

# License? 
Have fun! 
