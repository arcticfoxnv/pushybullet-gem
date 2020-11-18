# frozen_string_literal: true

require 'pushybullet/concerns'

module Pushybullet
  module Types
    class Device
      extend Pushybullet::Concerns::FromHash

      # strings
      attr_accessor :iden, :icon, :nickname, :manufacturer, :model,
                    :fingerprint, :key_fingerprint, :push_token, :has_sms,
                    :type, :kind, :remote_files

      # bools
      attr_accessor :active, :generated_nickname, :pushable

      # floats
      attr_accessor :created, :modified

      # ints
      attr_accessor :app_version
    end
  end
end
