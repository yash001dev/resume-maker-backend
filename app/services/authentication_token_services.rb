class AuthenticationTokenService
    HMAC_SECRET="my$ecretK3y"
    ALGORITHM_TYPE="HS256"

    def self.call
        payload={"test"=>"blah"}
        token=JWT.encode payload, HMAC_SECRET, "HS256"
    end
end