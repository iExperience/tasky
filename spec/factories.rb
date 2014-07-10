FactoryGirl.define do
  factory :project do
    name "Learn Rails"
    description "Learning lots of things about Rails"
  end

  factory :user do
    name "Salman Ansari"
    email "salman@ixperience.co.za"
    password "password"
    password_confirmation "password"
  end
end