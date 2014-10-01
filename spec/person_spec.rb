require_relative '../person.rb'
require 'rspec'

describe Person do

  it 'says something' do
    expect('hello').to eq 'hello'
  end
end
