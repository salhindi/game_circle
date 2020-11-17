require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    set :views, "app/views"
    enable :sessions
    set :public_folder, "public"
    set :session_secret, "security"
  end

  get "/" do
    erb :welcome
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
