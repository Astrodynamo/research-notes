class UsersController < ApplicationController

    ###login, logout, signup, destroy acct

    get '/signup' do
        if !logged_in?
            erb :"/users/new"
        else
            redirect "/"
        end
    end
    
end
