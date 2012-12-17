FactoryGirl.define do
  
  factory :user do
    sequence(:full_name) {|n| "Alguien_#{n}"}
    sequence(:email) {|n| "a_a#{n}@gmailsaasasqwweaeeda.com"}
    password "password"
  end

  factory :category do
    name_category "example category name"
    user

    factory :invalid_category do
      name_category ""
    end
  end

  factory :list do
    title "example list title"
    description "description example"
    category

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
    task

    factory :invalid_reminder do
      time ""
    end
  end
end
