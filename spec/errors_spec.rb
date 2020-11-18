# frozen_string_literal: true

require 'json'
require 'pushybullet/concerns'

RSpec.describe Pushybullet::Errors do
  describe described_class::ClientError do
    describe '.initialize' do
      subject { described_class.new(exception, response) }
      let(:exception) { RuntimeError.new('test') }

      context 'with response hash' do
        let(:response) do
          {
            status: 401,
            headers: {
              'Content-Type' => 'application/json'
            },
            body: JSON.dump({
                              error: {
                                cat: '~(=^‥^)',
                                message: 'Unauthorized',
                                type: 'invalid_request'
                              }
                            })
          }
        end

        it 'sets @cat' do
          expect(subject.cat).not_to be_nil
          expect(subject.cat).to eq '~(=^‥^)'
        end

        it 'sets @message' do
          expect(subject.message).not_to be_nil
          expect(subject.message).to eq 'Unauthorized'
        end

        it 'sets @type' do
          expect(subject.type).not_to be_nil
          expect(subject.type).to eq 'invalid_request'
        end
      end
    end
  end
end
