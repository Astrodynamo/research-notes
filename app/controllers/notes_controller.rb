class NotesController < ApplicationController
    ###create new, index from topic, update, destroy
    get '/notes' do
        redirect "/topics"
    end

    post '/notes' do
        topic = Topic.find(params[:topic_id])
        if !logged_in?
            redirect "/login"
        elsif current_user.id == topic.user_id
            note = Note.create(params)           
        end
        redirect "/topics/#{topic.id}" 
    end

    #get '/topics/:id' do
    #    "Showing individual topic page, topic notes & create note link, topic edit and destroy links"
    #    @topic = Topic.find(params[:id])
    #    if !logged_in?
    #        redirect "/login"
    #    elsif current_user.id == @topic.user_id
    #        erb :"/topics/show"
    #    else
    #        redirect "/topics"
    #    end
    #end
end