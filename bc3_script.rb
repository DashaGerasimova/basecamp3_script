require './basecamp_requester'
require 'set'

requester = BasecampRequester.new

# GET /people.json
response = requester.get_all_people
puts "Getting all people: #{response.code} #{response.message}"
all_people = response.parsed_response

# GET /projects.json
projects = requester.get_all_projects
puts "Getting all projects: #{projects.code} #{projects.message}"
all_projects = response.parsed_response

#Getting all people who have access to any projects
people_who_have_project = Set.new

all_projects.each do |project|
  response = requester.get_people_on_project(project["id"])
  puts "Getting all people on project №#{project["id"]}: #{response.code} #{response.message}"
  people_who_have_project += response.parsed_response 
end

#Deleting all people without projects
people_to_delete = all_people - people_who_have_project.to_a

people_to_delete.each do |person|
  response = requester.delete_person(person["id"])
  puts "Trying to delete person №#{person["id"]}: #{response.code} #{response.message}"
end
