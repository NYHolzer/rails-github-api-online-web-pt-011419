class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    response = Faraday.post "http://github.com/login/oauth/access_token" do |req|
        req.body = {'client_id': ENV['GITHUB_CLIENT_ID'], 'client_secret': ENV['GITHUB_SECRET'], 'code': params[:code]}
        req.headers['Accept'] = 'application/json'
    end
    session[:token] = params[:code]
    redirect_to root_path
  end
end
