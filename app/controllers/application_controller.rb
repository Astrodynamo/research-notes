class ApplicationController < Sinatra::Base
    
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'something_secure'
    end

    get '/' do
        erb :"/index"
    end

    helpers do ###add authentication required flash notice?
        def logged_in?
            !!current_user
        end

        def current_user
            @user ||= User.find(session[:user_id]) if session[:user_id]
        end
    end

end