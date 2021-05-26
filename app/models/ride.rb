class Ride < ActiveRecord::Base
  belongs_to :driver
  belongs_to :passenger

  def print_detail
    puts "#{self.driver.full_name} drove #{self.passenger.full_name} for #{self.price} from #{self.pick_up} to #{self.drop_off}"
  end

end