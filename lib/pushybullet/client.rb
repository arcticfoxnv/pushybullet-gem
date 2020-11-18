# frozen_string_literal: true

require 'faraday_middleware'
require 'json'
require 'pushybullet/middleware/error'
require 'pushybullet/types'

module Pushybullet
  class Client
    def initialize(access_token, request_timeout = 3)
      @access_token = access_token
      @request_timeout = request_timeout
    end

    def devices
      resp = conn.get('v2/devices')
      devs = []
      puts resp.body
      resp.body['devices'].each do |data|
        devs << Pushybullet::Types::Device.from_hash(data)
      end

      devs
    end

    def create_push(push)
      payload = JSON.dump(push.to_hash)
      resp = conn.post('v2/pushes', payload, 'Content-Type' => 'application/json')
      Pushybullet::Types::Push.from_hash(resp.body)
    end

    def push_link(title, body, url, target)
      push = Pushybullet::Types::Push.from_hash({
                                                  type: :link,
                                                  title: title,
                                                  body: body,
                                                  url: url
                                                })
      push.target = target
      create_push(push)
    end

    def push_note(title, body, target)
      push = Pushybullet::Types::Push.from_hash({
                                                  type: :note,
                                                  title: title,
                                                  body: body
                                                })
      push.target = target
      create_push(push)
    end

    private

    def conn
      @conn ||= Faraday.new 'https://api.pushbullet.com' do |conn|
        conn.options.timeout = @request_timeout
        conn.headers['Access-Token'] = @access_token

        conn.request :json
        conn.response :json, content_type: /\bjson$/

        conn.use :instrumentation if defined?(ActiveSupport)
        conn.use Pushybullet::Middleware::Error
        conn.use Faraday::Response::RaiseError
      end
    end
  end
end
