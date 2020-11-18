module Pushybullet
  module Types
    class PushTarget
      ID_TYPES = {
        device: 'device_iden',
        email: 'email',
        channel: 'channel_tag',
        client: 'client_iden'
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
