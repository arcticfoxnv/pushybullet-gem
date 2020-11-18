# frozen_string_literal: true

module Pushybullet
  module Concerns
    module FromHash
      def from_hash(data)
        o = new
        data.each do |key, value|
          o.send("#{key}=", value)
        end

        o
      end
    end

    module ToHash
      def to_hash
        d = {}
        instance_variables.each do |name|
          val = instance_variable_get(name)
          d[name[1..-1]] = val unless val.nil?
        end

        d
      end
    end
  end
end
