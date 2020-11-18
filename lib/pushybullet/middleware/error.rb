# frozen_string_literal: true

require 'pushybullet/errors'

module Pushybullet
  module Middleware
    class Error < Faraday::Response::RaiseError
      def on_complete(env)
        case env[:status]
        when 401
          raise Errors::Unauthorized, response_values(env)
        when 403
          raise Errors::Forbidden, response_values(env)
        when 429
          raise Errors::TooManyRequests, response_values(env)
        end
      end
    end
  end
end
