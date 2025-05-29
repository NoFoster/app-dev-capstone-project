class MiscController < ApplicationController
  def homepage
      render({ :template => "misc/homepage"})
  end

  def new_profile
    render({ :template => "misc/new_profile"})
  end

  end
