require 'haml'
require 'ostruct'

SiteConfig = OpenStruct.new(
               :title => 'Your Application Name',
               :author => 'Your Name',
               :url_base => 'http://localhost:4567/'
             )

module Example
  class Web < Sinatra::Base

    configure do
      set :public_folder, "#{File.dirname(__FILE__)}/../public"
      set :views, "#{File.dirname(__FILE__)}/../views"
      set :haml, { :attr_wrapper => '"' }
    end

    get "/" do
      User.find_or_create_from_auth_hash 'hoge'
      haml :index
    end

    get '/auth/:name/callback' do
      auth = request.env['omniauth.auth']
      p auth
      p auth["credentials"]["token"]
    end

  end
end

