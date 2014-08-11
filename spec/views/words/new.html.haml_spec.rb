require 'rails_helper'

RSpec.describe "words/new", :type => :view do
  before(:each) do
    assign(:word, Word.new(
      :original => "MyString",
      :translit => "MyString"
    ))
  end

  it "renders new word form" do
    render

    assert_select "form[action=?][method=?]", words_path, "post" do

      assert_select "input#word_original[name=?]", "word[original]"

      assert_select "input#word_translit[name=?]", "word[translit]"
    end
  end
end
