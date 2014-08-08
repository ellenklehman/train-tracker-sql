require 'spec_helper'

describe 'Train' do
  describe 'initialize' do
    it 'initializes with a line name and an id' do
      new_train = Train.new({'name' => 'blue line'})
      expect(new_train).to be_an_instance_of Train
    end
  end

  it 'starts with an empty array' do
    new_train = Train.new({'name' => 'blue line'})
    expect(Train.all).to eq []
  end

  it 'saves train lines' do
    new_train = Train.new({'name' => 'blue line'})
    new_train.save
    expect(Train.all).to eq [new_train]
  end
end
