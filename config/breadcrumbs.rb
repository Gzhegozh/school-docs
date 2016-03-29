crumb :school_groups do
  link 'School Groups', school_groups_path
end

crumb :new_school_group do
  link 'New School Group'
  parent :school_groups
end

crumb :edit_school_group do |school_group|
  link 'Edit School Group'
  parent school_group
end


crumb :school_group do |school_group|
  link school_group.name, school_group
  parent :school_groups
end

crumb :school do |school|
  link school.name, school_group_school_path(school.school_group, school)
  parent school.school_group
end

crumb :new_school do |school_group|
  link 'New School'
  parent school_group
end

crumb :edit_school do |school_group|
  link 'Edit School'
  parent school_group
end

crumb :grade do |grade|
  link grade.name, school_group_school_grade_path(grade.school.school_group, grade.school, grade)
  parent grade.school
end

crumb :new_grade do |school|
  link 'New Grade'
  parent school
end

crumb :choose_students do |grade|
  link 'Choose Students'
  parent grade
end
