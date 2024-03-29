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
      auth = auth_hash
      user = User.find_or_create_from_auth_hash(params[:name], auth_hash)

      #p auth
      #p auth["credentials"]["token"]
      #p auth
      p auth["credentials"]
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end

    class Stream
      def each
        100.times { |i| yield "#{i}\n" }
      end
    end

    get "/hoge" do
      Stream.new
    end

  end
end

