require 'rails_helper'
RSpec.describe WordStatistic, :type => :model do

  before(:each) do
    @word = Word.new( :original => "test", :translit => "тест" )
    #@word_statistic = FactoryGirl.create(:word_statistic, word_id: @word)
    @word_statistic = WordStatistic.create!(word_id: "1",views: "1", know: "1", unknow: "1")
  end

  subject(:word_statistic) { @word_statistic }

  it { should respond_to(:word_id) }
  it { should respond_to(:views) }
  it { should respond_to(:know) }
  it { should respond_to(:unknow) }

  it { should be_valid }

  describe 'Cheking model param [:word_id]' do

    context "when is blank" do
      before do
        subject.word_id = ""
      end
      it { expect(subject.valid?).to be false }
    end

    context "when error word_id" do
      before do
        subject.word_id = 123123
      end
      it "don't foud word_id" do
        expect(Word.where(id: subject.word_id)).to be_empty
      end
    end

  end

  describe 'Cheking model param [:views]' do

    context "when is blank" do
      before do
        subject.views = ""
      end
      it { expect(subject.valid?).to be false }
    end

    context "when is string" do
      before do
        subject.views = "asdasd"
      end
      it { expect(subject.valid?).to be false }
    end


  end

  describe 'Cheking model param [:know, :unknow]' do

    context "when is string" do
      before do
        subject.know = "asdasd"
        subject.unknow = "asdasd"
      end
      it { expect(subject.valid?).to be false }
    end

  end

end


