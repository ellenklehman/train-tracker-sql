class Train
attr_reader :name

  def initialize(attributes)
    @name = attributes['name']
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
    DB.exec("INSERT INTO train_line (name) VALUES ('#{@name}');")
  end

  def ==(another_train)
    self.name == another_train.name
  end


end
