class SessionsController < ApplicationController

  skip_before_filter :authenticate

  def new
    if params[:login]
      if user = User.find_by_login_and_password(params[:login], Digest::SHA1.hexdigest(params[:password]))
        session[:user] = user.id
        redirect_to session[:return_to].nil? ? root_url : session[:return_to]
      else
        flash[:error] = "Usuário e senha inválidos."        
        flash.discard 
      end
    end
  end

  def destroy
    session[:user] = nil
    flash[:notice] = "Você saiu do sistema."
    redirect_to root_url 
  end

end