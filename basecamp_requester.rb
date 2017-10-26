require 'httparty'

class BasecampRequester
  include HTTParty
  base_uri "https://3.basecampapi.com/#{ENV["ACCOUNT_ID"]}"

  def initialize()
    @options = {
      headers: {
        "Authorization" => "Bearer #{ENV["ACCESS_TOKEN"]}",
        "User-Agent" => "#{ENV["USER_AGENT_APP"]} #{ENV["USER_AGENT_LINK"]}"
      }
    }
  end

  # GET /people.json
  def get_all_people
    self.class.get("/people.json", @options)
  end

  # GET /projects/1/people.json
  def get_people_on_project(project_id)
    self.class.get("/projects/#{project_id}/people.json", @options)
  end

  # DELETE /people/1.json
  def delete_person(person_id)
    self.class.delete("/people/#{person_id}.json", @options)
  end

  # GET /projects.json
  def get_all_projects
    self.class.get("/projects.json", @options)
  end
end

#Tips for getting ACCESS_TOKEN
# https://launchpad.37signals.com/authorization/new?type=web_server&client_id=57390960e6fede11f9fe7598d0a7748abe16d94d&redirect_uri=https://eventstask.herokuapp.com/users/sign_in
# curl -d "type=web_server&client_id=57390960e6fede11f9fe7598d0a7748abe16d94d&redirect_uri=https://eventstask.herokuapp.com/users/sign_in&client_secret=6e8e5cda5c8618953b42f4c47518e0ace7c3699a&code=e035408c" -X POST https://launchpad.37signals.com/authorization/token
