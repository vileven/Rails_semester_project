FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    avatar ""
  end

  factory :admin do
    admin true
  end

  factory :question do
    title "Hello"
    content "Lorem ipsum"
    association :author, factory: :user
  end
end

