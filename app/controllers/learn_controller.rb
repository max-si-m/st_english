class LearnController < ApplicationController
  include RailsTemporaryData::ControllerHelpers
  before_action :get_words, only: :start
  before_action :set_word, only: [:start, :next]


  def index
  end

  def start
    render "next"
  end

  def next
  end

  protected
  def get_words
    if params[:start_date] && params[:finish_date]
      @words = Word.from_date(3.day.ago, Time.now)
      set_tmp_data("learn_words", @words.to_a, Time.now + 1.days)
    else
      @words = Word.from_date(3.day.ago, Time.now)
    end
  end

  def set_word
    @word = get_tmp_data("learn_words").data.first
  end

end
