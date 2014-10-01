require_relative '../dragon.rb'
require 'rspec'

describe Dragon do

  it 'says something' do
    expect('hello').to eq 'hello'
  end
end
