# frozen_string_literal: true

require 'pushybullet/concerns'

module Pushybullet
  module Types
    class PushRequest
      include Pushybullet::Concerns::FromHash
      include Pushybullet::Concerns::ToHash

      # strings
      attr_accessor :type, :title, :body, :url, :file_name, :file_type, :file_url,
                    :source_device_iden, :device_iden, :client_iden, :channel_tag,
                    :email, :guid

      def target=(target)
        instance_variable_set("@#{target.key}", target.value) unless target.nil?
      end
    end
  end
end
