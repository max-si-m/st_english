class LearnController < ApplicationController
  def index
    @words = Word.all.from_date(3.day.ago, Time.now)
  end

  def next
  end
end
