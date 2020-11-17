class PlatformsController < ApplicationController
        get '/platforms' do 
            if logged_in?
                @platforms = Platform.all.reverse 
                erb :'platforms/index'
            else
                redirect '/login'
            end
        end

        get '/platforms/new' do
            if logged_in?
                erb :'/platforms/new'
            else
                redirect :'/login'
            end
        end

        get '/platforms/:id' do 
            if logged_in?
                @platform = Platform.find(params["id"])
                erb :'platforms/show'
            else
                redirect '/login'
            end
        end

        post '/platforms' do
            platform = current_user.platforms.build(params)
            if !platform.name.empty? 
                platform.save
                redirect '/platforms'
            else
                @error = "Something's not right. Try again."
                erb :'/platforms/new'
            end
            #ADD IF "WII" puts wii logo put wii_image, if xbox puts xbox logo..etc
        end

        get '/platforms/:id/edit' do 
            if logged_in?
                @platform = Platform.find(params[:id])
                erb :'/platforms/edit'
            else
                redirect '/login'
            end
        end

        patch '/platforms/:id' do
            @platform = Platform.find(params[:id])
            if !params["platform"]["name"].empty?
                @platform.update(params["platform"])
                # if !platform.name.empty? 
                #     platform.update(params["platform"]) 
                    redirect "/platforms/#{params[:id]}"
            else
                @error = "Something's not right. Try again."
                erb :'/platforms/edit'
            end
                # platform.update(name: params["name"], games: params["games"])
                
        end

        delete '/platforms/:id' do 
            platform = Platform.find(params[:id])
            platform.destroy
            redirect '/platforms'
        end
end
