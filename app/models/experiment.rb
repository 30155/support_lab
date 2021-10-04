class Experiment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :weather

  validates :datetime, :title, presence: true
  validates :temperature, :humidity, numericality: { allow_blank: true, message: 'is invalid. Input numbers.' }
end
