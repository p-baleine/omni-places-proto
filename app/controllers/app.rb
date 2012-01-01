require 'haml'
require 'ostruct'
require 'omniauth-twitter'

SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/')

module Example
  class Web < Sinatra::Base
    use Rack::Session::Cookie
    use OmniAuth::Builder do
      provider :twitter, 'etqFT6toO5bFOi03usnCg', 'Brxl7bMlXZ8GJa87wm5E2VU34rhZuNJENhDkBypY18'
    end

    configure do
      set :public_folder, "#{File.dirname(__FILE__)}/../public"
      set :views, "#{File.dirname(__FILE__)}/../views"
      set :haml, { :attr_wrapper => '"' }
    end

    get "/" do
      haml :index
    end

    post '/auth/:name/callback' do
      auth = request.env['omniauth.auth']
      p auth
    end

  end
end

