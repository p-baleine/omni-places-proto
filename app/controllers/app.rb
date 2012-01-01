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
      haml :index
    end

    get '/auth/:name/callback' do
      user = User.find_or_create_from_auth_hash(auth_hash)
      self.current_user = @user
      redirect_to '/'

      p auth
      p auth["credentials"]["token"]
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end

  end
end

