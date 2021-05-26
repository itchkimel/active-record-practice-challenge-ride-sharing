class Driver < ActiveRecord::Base
  has_many :rides 
  has_many :passengers, through: :rides

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def accept_ride_request(passenger, price, pick_up, drop_off)
    Ride.create(driver: self, passenger: passenger, price: price, pick_up: pick_up, drop_off: drop_off)
  end

  def total_income
    self.rides.sum(:price)
  end

  def cancel_ride(passenger)
    canceled = self.rides.find_by(passenger: passenger, driver: self)
    canceled.destroy
  end

  def self.most_active
    self.all.max_by do |ride_instance|
      ride_instance.rides.length
    end
  end

  def self.best_performing
    self.all.sort{ |a, b| b.rating <=> a.rating}.first
  end

end