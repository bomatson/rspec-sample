require_relative '../dragon.rb'
require 'rspec'

describe Dragon do

  it 'exists' do
    expect(Dragon).to be
  end

  # notice the let statements

  describe 'on initialize' do
    context 'without magic' do
      let(:dragon) { Dragon.new }

      it 'is not magical' do
        expect(dragon.magical).to eq false
      end
    end

    context 'with magic' do
      let(:dragon) { Dragon.new(magical: true) }

      it 'is totally magical' do
        expect(dragon.magical).to eq true
      end
    end
  end

  # notice the subject usage

  describe '#name' do
    subject { Dragon.new }

    before do
      subject.name = 'roger'
    end

    it 'can be set' do
      expect(subject.name).to eq 'roger'
    end
  end

  describe '#fly' do
    it 'tells us the dragon is flying' do
      expect(subject.fly).to eq 'flying'
    end
  end
end
