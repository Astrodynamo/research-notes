class NotesController < ApplicationController
    ###create new, update, destroy
    get '/notes' do
        redirect "/topics"
    end

    post '/notes' do
        stripped = []
        params.values.each {|value| stripped << value.strip }
        topic = Topic.find(params[:topic_id])
        redirect "/topics/#{topic.id}" if stripped.include?("") 

        if !logged_in?
            redirect "/login"
        elsif current_user.id == topic.user_id
            note = Note.create(params)           
        end
        redirect "/topics/#{topic.id}" 
    end

    get '/notes/:id/edit' do
        redirect "/login" unless !!logged_in?

        @note = Note.find(params[:id])
        @topic = Topic.find(@note.topic_id)
        if @topic.user_id == current_user.id
            erb :"/notes/update"
        else
            redirect "/topics/#{@topic.id}"
        end
    end

    patch '/notes/:id' do
        stripped = []
        params.values.each {|value| stripped << value.strip }
        redirect "/topics/#{params[:id]}/edit" if stripped.include?("") 

        note = Note.find(params[:id])
        topic = Topic.find(note.topic_id)
        note.update(title: params[:title], content: params[:content]) if topic.user_id == current_user.id
        redirect "/topics/#{topic.id}"
    end

    delete '/notes/:id' do
        redirect "/login" unless !!logged_in?

        note = Note.find(params[:id])
        topic = Topic.find(note.topic_id)
        note.destroy if topic.user_id == current_user.id

        redirect "/topics/#{topic.id}"
    end 
end