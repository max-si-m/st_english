# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word, :class => 'Word' do
    original "MyString"
    translit "MyString"
  end
end
