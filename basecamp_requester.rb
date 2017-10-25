require 'httparty'

class BasecampRequester
  include HTTParty
  base_uri "https://3.basecamp.com/#{ENV["ACCOUNT_ID"]}"

  def initialize()
    @options = {
      headers: {
        "Authorization" => "Bearer #{ENV["ACCESS_TOKEN"]}"
      }
    }
  end

  # GET /people.json
  def get_all_people
    self.class.get("/projects/people.json", @options)
  end

  # GET /projects/1/people.json
  def get_people_on_project(project_id)
    self.class.get("/projects/#{project_id}/people.json", @options)
  end

  # GET /projects.json
  def get_all_projects
    self.class.get("/projects.json", @options)
  end
end
