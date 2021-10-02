class Schedule < ApplicationRecord
  belongs_to :user

  validates :datetime, :plan, presence: true

  def start_time
    datetime
  end
end
