module Api
    module V1
        class AuthenticationController < ApplicationController
            rescue_from ActionController::ParameterMissing, with: :parameter_missing
            def create
                render json: {token:'123'}, status: :created
            end

            private
            def parameter_missing(exception)
                render json: {error: exception.message}, status: :bad_request
            end
        end
    end
end