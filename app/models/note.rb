class Note < ApplicationRecord
  belongs_to :user

  validates :word, :word_kana, presence: true
end
