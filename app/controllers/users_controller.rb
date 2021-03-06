class UsersController < ApplicationController

    ###login, logout, signup, ...... add destroy acct?

    get '/signup' do
        if !!logged_in?
            redirect "/topics"
        else
            erb :"/users/new"
        end
    end

    post '/signup' do
        stripped = []
        params.values.each {|value| stripped << value.strip }
        redirect "/signup" if stripped.include?("")

        User.all.each do |user|
            if user.email == params[:email]
                redirect "/login"
            elsif user.username == params[:username]
                redirect "/signup"
            end
        end

        user = User.create(params)
        session[:user_id] = user.id
        redirect "/topics"
    end

    get '/login' do
        if !!logged_in?
            redirect "/topics"
        else
            erb :"/users/login"
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/topics"
        else
            redirect "/login"
        end
    end

    get '/logout' do
        session.clear if session[:user_id]
        redirect "/login"
    end
    
end
