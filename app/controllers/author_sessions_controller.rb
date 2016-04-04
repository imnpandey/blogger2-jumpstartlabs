class AuthorSessionsController < ApplicationController

  def new
    if logged_in?
      flash.now.notice = "Already Logged In."
      redirect_to(root_path)
    end
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
