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

  factory :task do
    name "example name"
    status false
    list

    factory :invalid_task do
      name ""
    end
  end

  factory :reminder do
    date "11/05/2012"
    location "any location"
    repeat false
    time "16:00"

    factory :invalid_reminder do
      date ""
      time ""
    end
  end

  factory :category do
    name_category "example name category"
  end
end
