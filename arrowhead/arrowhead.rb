class Arrowhead

  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody",
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow",
    },
  }
  
  @region_error = "Unknown region, please provide a valid region."
  @shape_error = "Unknown shape value. Are you sure you know what you're talking about?"
  
  def self.classify(region, shape)
    self.invalid_params(region, shape)
    shapes = self.shapes(region)
    arrowhead = shapes[shape]
    puts "You have a(n) '#{arrowhead}' arrowhead. Probably priceless."
  end
  
  
  def self.invalid_params(region, shape)
    raise @region_error unless valid_region? region
    raise @shape_error unless valid_shape?(region, shape)
  end
  
  def self.valid_region?(region)
    CLASSIFICATIONS.include? region
  end
  
  def self.valid_shape?(region, shape)
    CLASSIFICATIONS[region].include? shape
  end
  
  def self.shapes(region)
    CLASSIFICATIONS[region]
  end
end

Arrowhead.classify(:northern_plains, :bifurcated)