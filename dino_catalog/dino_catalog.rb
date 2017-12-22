require 'csv'

  catalog = CSV.read('dinodex.csv', headers: true, converters: :numeric)
  
  
  def find_name(category, value)
    
    category = category.upcase
    
    CSV.foreach('dinodex.csv', headers: true, converters: :numeric) do |row|
      if row[category] == value
        puts row["NAME"]
      end
    end
    
  end
  
  #african_catalog = CSV.read('african_dinosaur_export.csv')
  
  
  
  
find_name("WALKING", "Biped")
puts
find_name("DIET", "Carnivore")
puts
find_name("PERIOD", "Late Cretaceous")
puts
find_name("WEIGHT_IN_LBS", 2200)
puts

puts catalog