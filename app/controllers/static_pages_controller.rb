class StaticPagesController < ApplicationController

  def about
  end

  def contact
  end

  def signup
  end

  def login
  end

  def styles
  end

  def permission_denied
    render :permission_denied, layout: 'blank'
  end

end
