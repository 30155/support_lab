class Schedule < ApplicationRecord
  def start_time
    self.datetime
  end

  belongs_to :user
end
