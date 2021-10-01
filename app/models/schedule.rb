class Schedule < ApplicationRecord
  def start_time
    self.datetime
  end
end
