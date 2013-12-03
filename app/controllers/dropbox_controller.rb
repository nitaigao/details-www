class DropboxController < ApplicationController
	def clear
		session.delete(:access_token)
    redirect_to action: 'index'
	end

	def index
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = consumer.get_request_token
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret

    redirect_to request_token.authorize_url(:oauth_callback => "http://#{request.host_with_port}/dropbox/callback")
  end
 
  def callback
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = OAuth::RequestToken.new(consumer, session[:request_token], session[:request_token_secret])
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_token])

    session[:access_token]  = access_token.token
    session[:secret_token] = access_token.secret
    @client = Dropbox::API::Client.new :token => session[:access_token], :secret => session[:secret_token]

    redirect_to controller: 'notes'
  end
end
