class MiscController < ApplicationController
  def homepage
      render({ :template => "misc/homepage"})
  end
end
