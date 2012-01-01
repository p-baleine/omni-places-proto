require File.dirname(__FILE__) + '/config/boot.rb'

map "/" do
  use Rack::Session::Cookie
  use OmniAuth::Strategies::Twitter, 'etqFT6toO5bFOi03usnCg', 'Brxl7bMlXZ8GJa87wm5E2VU34rhZuNJENhDkBypY18'
  use OmniAuth::Strategies::Facebook, '328984203792754', 'f4b0fda0118d9c8f9652e74c2fae6191', :scope => 'read_stream'
  # use OmniAuth::Builder do
  #   provider :twitter, 'etqFT6toO5bFOi03usnCg', 'Brxl7bMlXZ8GJa87wm5E2VU34rhZuNJENhDkBypY18'
  # end

  run Example::Web.new
end
 
# run Rack::URLMap.new({
#   "/" => Example::Web
# })

