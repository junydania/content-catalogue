def path_to(page_name, id = '')
  name = page_name.downcase
  case name
    when 'home' then
      root_path
    when 'videos' then
      videos_path
    when 'videos' then
      videos_path
    when 'edit registration' then
      edit_user_registration_path
    when 'sign in' then
      new_user_session_path
    when 'projects' then
      projects_path
    when 'show video' then
      video_path(id)
    when 'show profile' then
      user_profile_path(id)
    else
      raise('path to specified is not listed in #path_to')
  end
end

Given(/^I go to "([^"]*)" page of  "([^"]*)"$/) do |page_name, id|
  visit path_to(page_name, id)
end

