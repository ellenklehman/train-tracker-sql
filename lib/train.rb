class Train
attr_reader :name

  def initialize(attributes)
    @name = attributes['name']
  end

  def self.all
    []
  end

end
