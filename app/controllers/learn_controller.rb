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
    @words_arr = get_tmp_data("learn_words").data
    first_tmp = @words_arr.shift
    size = SecureRandom.random_number(@words_arr.size)
    @words_arr.insert(size, first_tmp)
    update_tmp_data("learn_words", @words_arr.to_a )
    @word = first_tmp
    @word.word_statistic.increment_views
  end

  # def change_position(data)
  #   @words = get_tmp_data("learn_words").data
  #   size = SecureRandom.random_number(@words.size)
  #   @words.insert(size, data)
  #   puts "===> SIZE"
  #   puts size
  #   puts "===> DATA"
  #   puts data
  #
  #   # puts @words.each { |k| k.id }
  #   set_tmp_data("learn_words", @words.to_a, Time.now + 1.days)
  # end

end
