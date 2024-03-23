class AddressesController < ApplicationController
  def add_lat_lng
    addresses = Address.all
    addresses.update_all(country: "US")
    # addresses.update_all(lat: nil, lng: nil)
    addresses.each do |address|
      if !address.lat
        address_string = ""
        
        if address.address1
          address_string = address.address1
        end

        # if address.address2
        #   address_string = address_string + " " + address.address2
        # end
    
        if address.city
          address_string = address_string + " " + address.city
        end
    
        if address.state
          address_string = address_string + ", " + address.state
        end
    
        if address.country
          address_string = address_string + " " + address.country
        end
    
        if address.postal_code
          address_string = address_string + " " + address.postal_code
        end
    
        results = Geocoder.search(address_string)
        if results.first
          address.lat = results.first.coordinates[0]
          address.lng = results.first.coordinates[1]
          address.save
        end
      end
    end
    
  end
end
