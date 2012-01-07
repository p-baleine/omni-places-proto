module Example
  class Service

    def self.pg_conn(params=nil)
      params = {
        :host => DB_HOST,
        :port => 5432,
        :options => '',
        :tty => '',
        :dbname => DB_NAME,
        :user => DB_USER,
        :password => DB_PASSWORD
      }.merge(params || {})

      PGconn.connect params
    end

  end
end
