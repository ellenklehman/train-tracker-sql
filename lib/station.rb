require 'pry'
class Station
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM train_station;")
    stations = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      stations << Station.new({'name' => name, 'id' => id})
    end
    stations
  end

  def save
    results = DB.exec("INSERT INTO train_station (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_station)
    self.name == another_station.name
  end

  def edit(edit_info)
    @name = edit_info['name']
    DB.exec("UPDATE train_station SET name = '#{@name}';")
  end

  def delete
    DB.exec("DELETE FROM train_station WHERE id = #{self.id};")
  end

  def lines
    lines = []
    results = DB.exec("SELECT * FROM train_stops WHERE train_station_id = #{self.id};")
    results.each do |result|
      station_id = result['train_station_id'].to_i
      line_id = result['train_line_id'].to_i
      id_search = DB.exec("SELECT * FROM train_line WHERE id = #{line_id};")
      id_search.each do |result|
        line_name = result['name']
        lines << Train.new({'name' => line_name, 'id' => line_id})
      end
    end
    lines
  end

  def add_line(line_id)
    DB.exec("INSERT INTO train_stops (train_station_id, train_line_id) VALUES (#{self.id}, #{line_id});")
  end
end
