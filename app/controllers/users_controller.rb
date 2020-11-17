class UsersController < ApplicationController
    get '/signup' do
        erb :'users/signup' 
    end

    post '/signup' do 
        
        #if blank error and if exist error
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username and Password can't be blank."
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "Account already exists!"
            erb :'users/signup'
        else
            user.save
            session[:id] = user.id
            redirect '/platforms'
        end
    end
    # post '/users' do 
    # end

    # can sign up can delete account
end
