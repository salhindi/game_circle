class SessionsController < ApplicationController

    get '/login' do
        erb :'users/login' 
    end

    post '/login' do 
        if params["username"].empty? || params["password"].empty?
            @error = "Username and Password can't be blank."
            erb :'users/login'
        else 
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect '/platforms'
            else 
                @error = "Username or Password incorrect."
                erb :'users/login'
            end
        end
    end
    
    get '/logout' do
        session.clear
        redirect '/'
    end

end
