# frozen_string_literal: true

require 'pushybullet/types/push_request'
require 'pushybullet/types/push_target'

RSpec.describe Pushybullet::Types::PushRequest do
  let(:push) { described_class.new }

  describe '#target=' do
    describe 'channel target' do
      let(:target) { Pushybullet::Types::PushTarget.new(:channel, '123') }
      it 'sets channel_tag' do
        push.target = target
        expect(push.channel_tag).to eq target.value
      end
    end

    describe 'client target' do
      let(:target) { Pushybullet::Types::PushTarget.new(:client, '123') }
      it 'sets client_iden' do
        push.target = target
        expect(push.client_iden).to eq target.value
      end
    end

    describe 'device target' do
      let(:target) { Pushybullet::Types::PushTarget.new(:device, '123') }
      it 'sets device_iden' do
        push.target = target
        expect(push.device_iden).to eq target.value
      end
    end

    describe 'email target' do
      let(:target) { Pushybullet::Types::PushTarget.new(:email, '123@example.com') }
      it 'sets email' do
        push.target = target
        expect(push.email).to eq target.value
      end
    end
  end
end
