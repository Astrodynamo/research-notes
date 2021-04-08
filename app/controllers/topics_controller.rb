class TopicsController < ApplicationController
    ###create new, index, update, destroy (with all notes)
    get '/topics' do
        #"Create or Select a Topic to view Notes"
        if !!logged_in?
            erb :"/topics/user_topics" #display index of all topics if not signed in?
        else
            redirect "/login"
        end
    end

    get '/topics/new' do
        if !!logged_in?
            erb :"/topics/new"
        else
            redirect "/login"
        end
    end

    post '/topics' do
        if !!logged_in?
            user = current_user
            topic = Topic.create(title: params[:title], description: params[:description], user_id: user.id)
            binding.pry
            redirect "/topics/#{topic.id}"
        else
            redirect "/login"
        end
    end

    get '/topics/:id' do
        "Showing individual topic page"
    end
end
