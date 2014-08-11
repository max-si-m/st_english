class Word < ActiveRecord::Base
  has_one :word_statistic
  validates :original, :translit, presence: true, length: {maximum: 40, minimum: 2}
end
