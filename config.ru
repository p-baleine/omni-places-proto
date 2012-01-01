require File.dirname(__FILE__) + '/config/boot.rb'

map "/" do
  use Rack::Session::Cookie
  # use OmniAuth::Builder do
  #   provider :twitter, 'etqFT6toO5bFOi03usnCg', 'Brxl7bMlXZ8GJa87wm5E2VU34rhZuNJENhDkBypY18'
  # end

  run Example::Web.new
end
 
# run Rack::URLMap.new({
#   "/" => Example::Web
# })

