# frozen_string_literal: true

module Pushybullet
  module Errors
    class ClientError < Faraday::ClientError
      attr_reader :cat, :message, :type

      protected

      def exc_msg_and_response(exc, response = nil)
        headers = response[:headers]

        if headers['Content-Type'] =~ /\bjson$/
          err = JSON.parse(response[:body])
          @type = err[:error][:type]
          @message = err[:error][:message]
          @cat = err[:error][:cat]
        end

        super
      end
    end
    class Unauthorized < ClientError; end
    class Forbidden < ClientError; end
    class TooManyRequests < ClientError; end
  end
end
