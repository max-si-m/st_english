# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word_statistic, :class => 'WordStatistic' do
    views 1
    know 1
    unknow 1
    word_id 1
  end
end
