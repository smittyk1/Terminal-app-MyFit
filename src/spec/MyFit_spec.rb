# link to application
require_relative '../MyFit'
require 'rspec/autorun'

describe 'array_shuffle' do
    it 'it should return array.sample' do
        expect(array_shuffle(array)).to be(array.sample)
    end
end

describe 'clear_screen' do
    it 'it should clear terminal screen' do
        expect(clear_screen).to be(system('clear'))
    end
end