require 'rails_helper'

RSpec.describe "words/edit", :type => :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :original => "MyString",
      :translit => "MyString"
    ))
  end

  it "renders the edit word form" do
    render

    assert_select "form[action=?][method=?]", word_path(@word), "post" do

      assert_select "input#word_original[name=?]", "word[original]"

      assert_select "input#word_translit[name=?]", "word[translit]"
    end
  end
end
