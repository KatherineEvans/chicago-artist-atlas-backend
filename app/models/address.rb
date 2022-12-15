class Address < ApplicationRecord
  has_many :theaters

  def full_address
    address_string = ""

    if self.address1
      address_string = self.address1
    end

    if self.address2
      address_string = address_string + " " + self.address2
    end

    if self.address3
      address_string = address_string + " " + self.address3
    end

    if self.city
      address_string = address_string + " " + self.city
    end

    if self.state
      address_string = address_string + ", " + self.state
    end

    if self.country
      address_string = address_string + " " + self.country
    end

    if self.postal_code
      address_string = address_string + " " + self.postal_code
    end

    return address_string
  end
end
