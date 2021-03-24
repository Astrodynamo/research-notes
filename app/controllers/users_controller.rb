class UsersController < ApplicationController

    ###login, logout, signup, destroy acct

    get '/signup' do
        "Validate & create user, redirect"
        #if !logged_in?
        #    erb :"/users/new"
        #else
        #    redirect "/"
        #end
    end

    get '/login' do
        "Set user id in session if found, redirect"
    end

    get '/logout' do
        session.clear if session[:user_id].true
        redirect "/login"
    end
    
end
