class MiscController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, { :only => [:admin_dashboard] }

  def homepage
      render({ :template => "misc/homepage"})
  end

  def new_profile
    render({ :template => "misc/new_profile"})
  end

  def signed_out
    render({ :template => "misc/signed_out" })
  end

   def admin_dashboard
     @users = User.all
     render({ :template => "misc/admin_dashboard" })
    end

   private

    def authorize_admin!
      unless current_user.admin?
        redirect_to("/", { :alert => "Not authorized" })
      end
   end
  end
