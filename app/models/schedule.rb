class Schedule < ApplicationRecord
  belongs_to :user

  validates :datetime, :plan, presence: true

  def start_time
    self.datetime
  end
end
