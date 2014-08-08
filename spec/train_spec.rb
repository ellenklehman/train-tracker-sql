require 'spec_helper'

describe 'Train' do
  describe 'initialize' do
    it 'initializes with a line name and an id' do
      new_train = Train.new({'name' => 'blue line'})
      expect(new_train).to be_an_instance_of Train
    end
  end

  it 'starts with an empty array' do
    new_train = Train.new({'name' => 'blue line', 'id' => 1})
    expect(Train.all).to eq []
  end

  it 'saves train lines' do
    new_train = Train.new({'name' => 'blue line', 'id' => 1})
    new_train.save
    expect(Train.all).to eq [new_train]
  end

  it 'deletes train lines' do
    new_train = Train.new({'name' => 'blue line', 'id' => 1})
    new_train.save
    another_new_train = Train.new({'name' => 'purple line', 'id' => 2 })
    another_new_train.save
    new_train.delete
    expect(Train.all).to eq [another_new_train]
  end

  it 'can be edited' do
    new_train = Train.new({'name' => 'blue line', 'id' => 1})
    new_train.save
    new_train.edit({'name' => 'red line'})
    expect(new_train.name).to eq('red line')
  end

  it 'adds a stop to a train' do
    new_train = Train.new({'name' => 'blue line'})
    new_train.save
    new_station = Station.new({'name' => 'Clackamas'})
    new_station.save
    new_train.add_stop(new_station.id)
    expect(new_train.stops).to eq [new_station]
  end

  it 'begins with an empty array to store all the stops' do
    new_train = Train.new({'name' => 'blue line'})
    new_train.save
    expect(new_train.stops).to eq []
  end
end
