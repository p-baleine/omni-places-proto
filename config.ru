require File.dirname(__FILE__) + '/config/boot.rb'

run Rack::URLMap.new({
  "/" => Example::Web,
  "/auth/twitter" => Example::Web,
  "/auth/twitter/callback" => Example::Web,
})

