module Example
  class User < Example::Service

    def self.find_or_create_from_auth_hash(auth_hash)
      auth_hash
    end

  end
end
