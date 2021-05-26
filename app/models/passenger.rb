class Passenger < ActiveRecord::Base
  has_many :rides
  has_many :drivers, through: :rides

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def car_list
    self.drivers.map do |driver_inst|
    driver_inst.car 
    end.join(";")     
  end

  def self.average_rating
    self.average(:rating)
  end

  def self.worst_rating
    self.minimum(:rating)
  end  

  def self.worst_rating_in_existence
    self.worst_rating.to_i
  end 

end