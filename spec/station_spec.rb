require 'spec_helper'

describe 'Station' do
  describe 'initialize' do
    it 'is initialized with a name and an id' do
      new_station = Station.new({'name' => 'Clackamas', 'id' => 2})
      expect(new_station).to be_an_instance_of Station
    end
  end

  it 'starts with an empty array' do
    new_station = Station.new({'name' => 'Clackamas', 'id' => 2})
      expect(Station.all).to eq []
  end

  it 'saves stations to an array' do
    new_station = Station.new({'name' => 'Clackamas', 'id' => 2})
    new_station.save
    expect(Station.all).to eq [new_station]
  end

  it 'updates station information' do
     new_station = Station.new({'name' => 'Clackamas', 'id' => 2})
     new_station.save
     new_station.edit({'name' => 'Paddington'})
     expect(new_station.name).to eq 'Paddington'
  end

  it 'deletes stations' do
     new_station = Station.new({'name' => 'Clackamas', 'id' => 2})
     new_station.save
     new_station.delete
     expect(Station.all).to eq []
   end

  it 'adds a train line to a station' do
    new_station = Station.new({'name' => 'Clackamas'})
    new_station.save
    new_train = Train.new({'name' => 'blue line'})
    new_train.save
    new_station.add_line(new_train.id)
    expect(new_station.lines).to eq [new_train]
  end

  it 'begins with an empty array to store all the lines' do
    new_station = Station.new({'name' => 'Clackamas'})
    new_station.save
    expect(new_station.lines).to eq []
  end
end
