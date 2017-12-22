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
  
  def big_dinosaurs
    CSV.foreach('dinodex.csv', headers: true, converters: :numeric) do |row|
      row["WEIGHT_IN_LBS"] = row["WEIGHT_IN_LBS"].to_i
      
      if row["WEIGHT_IN_LBS"] > 4000
        puts row["NAME"]
      end
    end
  end
  
  
find_name("walking", "Biped")
puts

big_dinosaurs
puts