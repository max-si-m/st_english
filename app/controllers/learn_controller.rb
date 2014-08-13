class LearnController < ApplicationController
  def index
  end

  def start
    if params[:start_date] && params[:finish_date]
      @words = Word.from_date(3.day.ago, Time.now)
    else
      @words = Word.from_date(3.day.ago, Time.now)
    end
  end

    def next
  end
end
