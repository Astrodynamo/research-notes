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
            redirect "/topics/#{topic.id}"
        else
            redirect "/login"
        end
    end

    get '/topics/:id' do
        "Showing individual topic page, topic notes & create note link, topic edit and destroy links"
        @topic = Topic.find(params[:id])
        if !logged_in?
            redirect "/login"
        elsif current_user.id == @topic.user_id
            erb :"/topics/show"
        else
            redirect "/topics"
        end
    end

    get '/topics/:id/edit' do
        redirect "/login" unless !!logged_in?

        @topic = Topic.find(params[:id])
        if @topic.user_id == current_user.id
            erb :"/topics/update"
        else
            redirect "/topics/#{@topic.id}"
        end
    end

    patch '/topics/:id' do
        topic = Topic.find(params[:id])
        topic.update(title: params[:title], description: params[:description]) if topic.user_id == current_user.id
        redirect "/topics/#{topic.id}"
    end

    delete '/topics/:id' do
        redirect "/login" unless !!logged_in?

        topic = Topic.find(params[:id])
        if topic.user_id == current_user.id ###does belongs_to relationship take care of note deletions? no
            topic.notes.each {|note| note.destroy}
            topic.destroy
        end 
        
        redirect "/topics"
    end 
end
