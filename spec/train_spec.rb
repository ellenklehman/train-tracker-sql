require 'rspec'
require 'train'

describe 'Train' do
  describe 'initialize' do
    it 'initializes with a line name and an id' do
      new_train = Train.new({'name' => 'blue line'})
      expect(new_train).to be_an_instance_of Train
    end
  end
end
