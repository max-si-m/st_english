class Word < ActiveRecord::Base
  after_create :create_relation

  has_one :word_statistic, dependent: :destroy
  validates :original, :translit, presence: true, length: {maximum: 40, minimum: 2}

  scope :from_date, ->(start_time, finish_time) { where( :created_at => start_time..finish_time ) }

  protected
  def create_relation
    WordStatistic.create(word: self)
  end
end
