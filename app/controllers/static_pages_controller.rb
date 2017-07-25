class StaticPagesController < ApplicationController
  before_filter :authorize_user, only: [:profile]
  
  def home
  end

  def about
  end
  
  def profile
    @courses = Course.all
  end
  
end
