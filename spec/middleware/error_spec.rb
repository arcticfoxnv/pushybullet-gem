# frozen_string_literal: true

require 'json'
require 'pushybullet/concerns'

RSpec.describe Pushybullet::Middleware do
  describe described_class::Error do
    describe '#on_complete' do
      let(:env) do
        e = Faraday::Env.new
        e.url = URI('http://localhost')
        e.status = status
        e.response_headers = {}
        e
      end
      subject { described_class.new }

      context 'on 401' do
        let(:status) { 401 }

        it 'raises Pushybullet::Errors::Unauthorized' do
          expect { subject.on_complete(env) }.to raise_error(Pushybullet::Errors::Unauthorized)
        end
      end

      context 'on 403' do
        let(:status) { 403 }

        it 'raises Pushybullet::Errors::Forbidden' do
          expect { subject.on_complete(env) }.to raise_error(Pushybullet::Errors::Forbidden)
        end
      end

      context 'on 404' do
        let(:status) { 404 }

        it 'raises Faraday::ResourceNotFound' do
          expect { subject.on_complete(env) }.to raise_error(Faraday::ResourceNotFound)
        end
      end

      context 'on 429' do
        let(:status) { 429 }

        it 'raises Pushybullet::Errors::TooManyRequests' do
          expect { subject.on_complete(env) }.to raise_error(Pushybullet::Errors::TooManyRequests)
        end
      end
    end
  end
end
