require './basecamp_requester'

# GET /people.json
requester = BasecampRequester.new

people = requester.get_all_people
puts "Getting all people: #{people.code} #{people.message}"

projects = requester.get_all_projects
puts "Getting all projects: #{projects.code} #{projects.message}"

