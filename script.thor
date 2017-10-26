require './basecamp_requester'
require 'set'
require 'thor'

class Script < Thor

  desc "run", "run script that detectes and deletes extra people"   # [4]
  method_options :delete => :boolean

  def run
    requester = BasecampRequester.new
    # GET /people.json
    response = requester.get_all_people
    puts "Getting all people: #{response.code} #{response.message}"
    all_people = response.parsed_response

    # GET /projects.json
    response = requester.get_all_projects
    puts "Getting all projects: #{response.code} #{response.message}"
    all_projects = response.parsed_response

    #Getting all people who have access to any projects
    people_who_have_project = Set.new

    all_projects.each do |project|
      response = requester.get_people_on_project(project["id"])
      puts "Getting all people on project №#{project["id"]}: #{response.code} #{response.message}"
      people_who_have_project += response.parsed_response
    end

    if options.delete?
      #Deleting all people without projects
      people_to_delete = all_people - people_who_have_project.to_a

      people_to_delete.each do |person|
        response = requester.delete_person(person["id"])
        puts "Trying to delete person №#{person["id"]}: #{response.code} #{response.message}"
      end
    end
  end
end

Script.start(ARGS)
