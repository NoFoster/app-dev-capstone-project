class AthletesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_athlete,   only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def authorize_user!
      unless current_user.admin? || @the_athlete.user_id == current_user.id
        redirect_to("/", { :alert => "You are not authorized to do that." })
      return
    end
   end

 def set_athlete
    matching = Athlete.where({ :id => params.fetch("path_id") })
    @the_athlete = matching.at(0)
  end


  
  def index
    matching_athletes = Athlete.all
    @list_of_athletes = matching_athletes.order({ :created_at => :desc })
    render({ :template => "athletes/index" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_athletes = Athlete.where({ :id => the_id })
    @the_athlete = matching_athletes.at(0)
    render({ :template => "athletes/show" })
  end

  def new
    render({ :template => "athletes/new" })
  end

  def create
    
    the_athlete = @the_athlete
    the_athlete.name = params.fetch("query_name")
    the_athlete.primary_sport = params.fetch("query_primary_sport")
    the_athlete.secondary_sport = params.fetch("query_secondary_sport")
    the_athlete.current_college = params.fetch("query_current_college")
    the_athlete.previous_college = params.fetch("query_previous_college")
    the_athlete.location = params.fetch("query_location")
    the_athlete.year = params.fetch("query_year")
    the_athlete.college_profile_url = params.fetch("query_college_profile_url")
    the_athlete.insta_url = params.fetch("query_insta_url")
    the_athlete.tik_tok_url = params.fetch("query_tik_tok_url")
    the_athlete.insta_follower_count = params.fetch("query_insta_follower_count")
    the_athlete.tik_tok_impres_avg = params.fetch("query_tik_tok_impres_avg")
    the_athlete.photo = params.fetch("query_photo")
    the_athlete.bio = params.fetch("query_bio")
    the_athlete.interests = params.fetch("query_interests")
    the_athlete.user_id = current_user.id
    
    if the_athlete.valid?
      the_athlete.save
      redirect_to("/athletes", { :notice => "Athlete created successfully." })
    else
      redirect_to("/athletes", { :alert => the_athlete.errors.full_messages.to_sentence })
    end
  end

  def edit
    render({ :template => "athletes/edit" })
  end
  
  def update

    the_athlete = @the_athlete
    the_athlete.name = params.fetch("query_name")
    the_athlete.primary_sport = params.fetch("query_primary_sport")
    the_athlete.secondary_sport = params.fetch("query_secondary_sport")
    the_athlete.current_college = params.fetch("query_current_college")
    the_athlete.previous_college = params.fetch("query_previous_college")
    the_athlete.location = params.fetch("query_location")
    the_athlete.year = params.fetch("query_year")
    the_athlete.college_profile_url = params.fetch("query_college_profile_url")
    the_athlete.insta_url = params.fetch("query_insta_url")
    the_athlete.tik_tok_url = params.fetch("query_tik_tok_url")
    the_athlete.insta_follower_count = params.fetch("query_insta_follower_count")
    the_athlete.tik_tok_impres_avg = params.fetch("query_tik_tok_impres_avg")
    the_athlete.photo = params.fetch("query_photo")
    the_athlete.bio = params.fetch("query_bio")
    the_athlete.interests = params.fetch("query_interests")
    the_athlete.user_id = params.fetch("query_user_id")

    if the_athlete.valid?
      the_athlete.save
      redirect_to("/athletes/#{the_athlete.id}", { :notice => "Athlete updated successfully."} )
    else
      redirect_to("/athletes/#{the_athlete.id}", { :alert => the_athlete.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @the_athlete.destroy
    redirect_to("/athletes", { :notice => "Athlete deleted successfully."} )
  end
end
