["Meeting", "Birth day", "Work", "Homework"].each do |ct|
  Category.find_or_create_by_name_category(ct)
end