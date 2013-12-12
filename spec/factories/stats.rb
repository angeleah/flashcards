# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stat, :class => 'Stats' do
    card_id 1
    user_id 1
    result false
    quiz_session_id 1
  end
end
