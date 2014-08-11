require 'rails_helper'

RSpec.describe "words/show", :type => :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :original => "Original",
      :translit => "Translit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Original/)
    expect(rendered).to match(/Translit/)
  end
end
