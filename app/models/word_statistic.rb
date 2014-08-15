# == Schema Information
#
# Table name: word_statistics
#
#  id         :integer          not null, primary key
#  word_id    :integer
#  views      :integer          default(0)
#  know       :integer          default(0)
#  unknow     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_word_statistics_on_word_id  (word_id)
#

class WordStatistic < ActiveRecord::Base
  belongs_to :word
  validates :word_id, presence: true
  validates :views, :know, :unknow,  numericality: { only_integer: true }

  def increment_know
    self.increment(:know).save
  end

  def increment_views
    self.increment(:views).save
  end

  def increment_unknow
    self.increment(:unknow).save
  end


end
