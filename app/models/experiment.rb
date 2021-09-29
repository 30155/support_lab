class Experiment < ApplicationRecord
  belongs_to :user

  validates :datetime, :title, presence: true
end
