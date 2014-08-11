# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word, :class => 'Words' do
    original "MyString"
    translit "MyString"
    color "c6c6c6"
  end
end
