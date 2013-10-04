# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    quote "MyText"
    statement "MyText"
    recent_exhibits "MyText"
    news "MyText"
    bibliography "MyText"
    contact "MyText"
    resume ""
    photo ""
  end
end
