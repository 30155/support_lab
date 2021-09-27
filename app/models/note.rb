class Note < ApplicationRecord
  belongs_to :user

  validates :word, :word_kana, presence: true

  def self.search(search)
    if search != ''
      Note.where('word LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end
end
