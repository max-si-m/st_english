class LearnController < ApplicationController
  include RailsTemporaryData::ControllerHelpers
  before_action :get_words, only: :start
  before_action :set_word, only: [:start, :know, :unknow]
  before_action :know_word, only: :know
  before_action :unknow_word, only: :unknow


  def index
  end

  def start
  end

  def know
    render "start"
  end
  def unknow
    render "start"
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
    @words_arr = get_tmp_data("learn_words").data
    @word = @words_arr.shift
  end

  def know_word
    @word.word_statistic.increment_know
    @words_arr.push(@word)
    update_data
  end

  def unknow_word
    @word.word_statistic.increment_unknow
    size = rand( @words_arr.size-5.abs..@words_arr.size )
    @words_arr.insert(size, @word)
    update_data
  end

  def update_data()
    update_tmp_data("learn_words", @words_arr.to_a )
  end

end
