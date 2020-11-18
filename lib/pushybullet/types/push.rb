# frozen_string_literal: true

require 'pushybullet/concerns'

module Pushybullet
  module Types
    class Push
      extend Pushybullet::Concerns::FromHash
      include Pushybullet::Concerns::ToHash

      # strings
      attr_accessor :iden, :type, :guid, :direction,
                    :sender_iden, :sender_email, :sender_email_normalized, :sender_name,
                    :receiver_iden, :receiver_email, :receiver_email_normalized,
                    :target_device_iden, :source_device_iden, :client_iden, :channel_iden,
                    :title, :body, :url, :file_name, :file_type, :file_url, :image_url

      # lists
      attr_accessor :awake_app_guids

      # bools
      attr_accessor :active, :dismissed

      # floats
      attr_accessor :created, :modified

      # ints
      attr_accessor :image_width, :image_height

      def target=(target)
        instance_variable_set("@#{target.key}", target.value) unless target.nil?
      end
    end
  end
end
