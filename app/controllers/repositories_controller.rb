class RepositoriesController < ApplicationController
  
  def index
    #GET user's login name
      user_resp = Faraday.get "https://api.github.com/user" do |req|
        req.headers = {'Authorization': "token #{session[:token]}"}
      end

      user_json = JSON.parse(user_resp.body)
      @username = user_json["login"]

    #GET user's list of repos
      user_repos = Faraday.get "https://api.github.com/user/repos" do |req|
        req.headers = {'Authorization': "token #{session[:token]}"}
      end

      binding.pry
      repos_json = JSON.parse(user_repos.body)
      @repos = repos_json
  end

end
