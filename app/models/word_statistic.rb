class WordStatistic < ActiveRecord::Base
  belongs_to :word
  validates :word_id, presence: true
  validates :views, :know, :unknow,  numericality: { only_integer: true }
end
