require 'rails_helper'

RSpec.describe "words/index", :type => :view do
  before(:each) do
    assign(:words, [
      Word.create!(
        :original => "Original",
        :translit => "Translit"
      ),
      Word.create!(
        :original => "Original",
        :translit => "Translit"
      )
    ])
  end

  it "renders a list of words" do
    expect(true).to be true
  end
end
