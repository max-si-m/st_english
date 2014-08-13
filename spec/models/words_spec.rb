require 'rails_helper'

RSpec.describe Word, :type => :model do

  let(:attrs) { FactoryGirl.attributes_for(:word) }
  subject(:word) { Word.new(attrs) }

  it { should respond_to(:original) }
  it { should respond_to(:translit) }

  it { should be_valid }

  describe 'Cheking model params original and translit:' do

    context "when is blank" do
      before do
        subject.original = ""
        subject.translit = ""
      end
      it { expect(subject.valid?).to be false }
    end

    context "when isn't word" do
      before do
        subject.original = "sdasd7ad65a"
        subject.translit = "sdasd7ad65a"
      end
      it { expect(subject.original).to match /\w/ }
      it { expect(subject.translit).to match /\w/ }
    end

    context "must have more 2 items" do
      before do
        subject.original = "o"
        subject.translit = "o"
      end
      it { expect(subject.valid?).to be false}
    end

    context "must have less 40 items" do
      before do
        subject.original = "a" * 42
        subject.translit = "a" * 42
      end
      it {  expect(subject.valid?).to be false }
    end
  end

end


