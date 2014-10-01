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

  # notice the subject usage & before

  describe '#name' do
    subject { Dragon.new }

    before do
      subject.name = 'roger'
    end

    it 'can be set' do
      expect(subject.name).to eq 'roger'
    end
  end

  describe '#age' do
    subject { Dragon.new }

    before do
      subject.age = 10
    end

    it 'can be set' do
      expect(subject.age).to eq 10
    end
  end

  describe '#fly' do
    it 'tells us the dragon is flying' do
      expect(subject.fly).to eq 'flying'
    end
  end

  # notice the let setting context for conditionals

  describe '#breathe_fire' do
    context 'given a magical dragon' do
      let(:dragon) { Dragon.new(magical: true) }

      it 'breathes fire all over the place' do
        expect(dragon.breathe_fire).to eq 'screaming villagers'
      end
    end

    context 'given a non-magical dragon' do
      let(:dragon) { Dragon.new }

      it 'breathes fire all over the place' do
        expect(dragon.breathe_fire).to eq 'air'
      end
    end
  end

  # notice use of stubs with a return value

  describe '#lay_eggs' do
    context 'given a of-age dragon' do
      let(:dragon) { Dragon.new }

      before do
        dragon.age = 22
        expect(dragon).to receive(:egg_count) { 5 }
      end

      it 'lays eggs' do
        expect(dragon.lay_eggs).to eq "just layed 5 eggs!"
      end
    end

    context 'given a under-age dragon' do
      let(:dragon) { Dragon.new }

      before do
        dragon.age = 4
      end

      it 'tells the dragon how long it has' do
        expect(dragon.lay_eggs).to eq 'you still have 17 years'
      end
    end
  end

  # notice use of mock expectations of Dragon

  describe '#hatch' do
    context 'given an egg_count' do
      let(:dragon) { Dragon.new }

      before do
        expect(dragon).to receive(:egg_count) { 5 }
          .at_least(:once)
      end

      it 'creates more dragons' do
        expect(Dragon).to receive(:new).exactly(5).times
        dragon.hatch!
      end
    end
  end
end
