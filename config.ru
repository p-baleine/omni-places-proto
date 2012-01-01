require File.dirname(__FILE__) + '/config/boot.rb'

map "/" do
  # TODO implement follow with Builder
  use Rack::Session::Cookie
  use OmniAuth::Strategies::Twitter, 'etqFT6toO5bFOi03usnCg', 'Brxl7bMlXZ8GJa87wm5E2VU34rhZuNJENhDkBypY18'
  use OmniAuth::Strategies::Facebook, '328984203792754', 'f4b0fda0118d9c8f9652e74c2fae6191', :scope => 'read_stream,offline_access'
  use OmniAuth::Strategies::GoogleOauth2, '539038450693.apps.googleusercontent.com', 'DCixZ8-4UaWQ_5JcBy_cck4a'
  
  run Example::Web.new
end
 
# run Rack::URLMap.new({
#   "/" => Example::Web
# })

