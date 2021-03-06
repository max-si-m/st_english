# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  original   :string(255)
#  translit   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Word < ActiveRecord::Base
  after_create :create_relation

  has_one :word_statistic, dependent: :destroy
  validates :original, :translit, presence: true, length: {maximum: 40, minimum: 2}

  scope :from_date, ->(start_time, finish_time) { where( :created_at => start_time..finish_time ) }
  default_scope     ->{ order('id DESC') }
  attr_accessor :data_array

  def self.search(search)
    if search
      where('original LIKE :search_param OR translit LIKE :search_param', :search_param => "%#{search}%")
    else
      all
    end
  end

  protected
  
  def create_relation
    WordStatistic.create(word: self)
  end
end
