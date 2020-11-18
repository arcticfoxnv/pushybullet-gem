# frozen_string_literal: true

require 'pushybullet/concerns'

class Dummy
  attr_accessor :foo, :bar
end

RSpec.describe Pushybullet::Concerns do
  describe Pushybullet::Concerns::FromHash do
    let(:dummy_class) { Dummy.extend(described_class) }

    describe '.from_hash' do
      let(:data) do
        {
          foo: 'bar'
        }
      end

      it 'sets foo' do
        obj = dummy_class.from_hash(data)
        expect(obj.foo).not_to be_nil
        expect(obj.foo).to eq data[:foo]
      end
    end
  end

  describe Pushybullet::Concerns::ToHash do
    let(:dummy_class) { Dummy.include(described_class) }

    describe '.to_hash' do
      let(:foo) { 'bar' }
      let(:obj) do
        o = dummy_class.new
        o.foo = foo
        o
      end

      it 'returns a dict with foo but not bar' do
        data = obj.to_hash
        expect(data).to include({ 'foo' => foo })
        expect(data.keys).not_to include('bar')
      end
    end
  end
end
