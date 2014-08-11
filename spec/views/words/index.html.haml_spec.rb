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
    render
    assert_select "tr>td", :text => "Original".to_s, :count => 2
    assert_select "tr>td", :text => "Translit".to_s, :count => 2
  end
end
