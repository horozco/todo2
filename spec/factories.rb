FactoryGirl.define do
  
  factory :user do
    sequence(:full_name) {|n| "Alguien_ #{n}"}
    sequence(:email) {|n| "a_a#{n}@b.com"}
    password "password"
  end

  factory :list do
    title "example list title"
    description "description example"
    user

    factory :invalid_list do
        title ""
    end
  end

end
