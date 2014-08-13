class Word < ActiveRecord::Base
  after_create :create_relation

  has_one :word_statistic, dependent: :destroy
  validates :original, :translit, presence: true, length: {maximum: 40, minimum: 2}


  protected
  def create_relation
    WordStatistic.create(word: self)
  end
end
