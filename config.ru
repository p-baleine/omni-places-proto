require File.dirname(__FILE__) + '/config/boot.rb'

# run Rack::URLMap.new({ "/" => Example::Web })

run Example::Web.new

