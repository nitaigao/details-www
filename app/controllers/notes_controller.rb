class NotesController < ApplicationController
	def index 
		redirect_to controller: 'dropbox' if session[:access_token].nil?
	end

	def note
		client = Dropbox::API::Client.new :token => session[:access_token], :secret => session[:secret_token]
		note = client.download params[:path]
		render text: note
	end

	def notes
		client = Dropbox::API::Client.new :token => session[:access_token], :secret => session[:secret_token]
	    notes = client.ls.reverse.map do |fileinfo|
	      {:path => fileinfo.path, :rev => fileinfo.rev}
	    end
	    render json: notes
	end
end
