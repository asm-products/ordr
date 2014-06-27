class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to url_for({controller: 'jobs', action: 'index'})
    else
      redirect_to url_for({controller: 'sessions', action: 'new'})
    end
  end
end
