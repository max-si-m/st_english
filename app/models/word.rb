class Word < ActiveRecord::Base
  after_create :create_relation

  has_one :word_statistic, dependent: :destroy
  validates :original, :translit, presence: true, length: {maximum: 40, minimum: 2}

  scope :from_date, ->(start_time, finish_time) { where( :created_at => start_time..finish_time ) }

  attr_accessor :data_array

  protected
  def create_relation
    WordStatistic.create(word: self)
  end

end
#TODO: sorting words
#arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]