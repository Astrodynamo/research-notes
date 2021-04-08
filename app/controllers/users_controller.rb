class UsersController < ApplicationController

    ###login, logout, signup, destroy acct

    get '/signup' do
        #"Validate & create user, redirect"
        if !!logged_in?
            redirect "/topics"
        else
            erb :"/users/new"
        end
    end

    post '/signup' do
        user = User.create(params)
        session[:user_id] = user.id
        redirect "/topics"
    end

    get '/login' do
        "Set user id in session if found, redirect"
    end

    get '/logout' do
        session.clear if session[:user_id].true
        redirect "/login"
    end
    
end
