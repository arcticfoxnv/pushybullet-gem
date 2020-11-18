# frozen_string_literal: true

module Pushybullet
  module Types
    class PushTarget
      ID_TYPES = {
        channel: 'channel_tag',
        client: 'client_iden',
        device: 'device_iden',
        email: 'email'
      }.freeze

      def initialize(type, id)
        @type = type
        @id = id
      end

      def key
        ID_TYPES[@type]
      end

      def value
        @id
      end
    end
  end
end
