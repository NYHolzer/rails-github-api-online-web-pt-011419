class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    response = Faraday.post ("https://github.com/login/oauth/access_token") do |req|
        req.body = {'client_id': ENV['GITHUB_CLIENT'], 'client_secret': ENV['GITHUB_SECRET'], 'code': '20'}
        req.headers = {
          'Accept'=>'application/json'
           }
    end

    session[:token] = params[:code]
    redirect_to root_path
  end
end
