class Train
attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM train_line;")
    lines = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      lines << Train.new({'name' => name, 'id' => id})
    end
    lines
  end

  def save
    results = DB.exec("INSERT INTO train_line (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_train)
    self.name == another_train.name
  end

  def delete
    DB.exec("DELETE FROM train_line WHERE id = #{self.id};")
  end

  def edit(new_name)
    @name = new_name['name']
    DB.exec("UPDATE train_line SET name = '#{@name}';")
  end
end
