["Windows", "Linux", "Mac OS X"].each do |os|
  OperatingSystem.find_or_create_by_name(os)
end