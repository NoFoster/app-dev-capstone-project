class BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_brand,   only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    matching_brands = Brand.all
    @list_of_brands = matching_brands.order({ :created_at => :desc })
    render({ :template => "brands/index" })
  end

  def show
    render({ :template => "brands/show" })
  end

  def new
    render({ :template => "brands/new" })
  end

  def create
    the_brand = Brand.new
    the_brand.name = params.fetch("query_name")
    the_brand.location = params.fetch("query_location")
    the_brand.business_type = params.fetch("query_business_type")
    the_brand.annual_revenue = params.fetch("query_annual_revenue")
    the_brand.description = params.fetch("query_description")
    the_brand.website_url = params.fetch("query_website_url")
    the_brand.insta_url = params.fetch("query_insta_url")
    the_brand.requirements = params.fetch("query_requirements")
    the_brand.logo = params.fetch("query_logo")
    the_brand.user_id = current_user.id

    if the_brand.valid?
      the_brand.save
      redirect_to("/brands", { :notice => "Brand created successfully." })
    else
      redirect_to("/brands", { :alert => the_brand.errors.full_messages.to_sentence })
    end
  end

def edit
    render({ :template => "brands/edit" })
end

  def update

    the_brand = @the_brand
    the_brand.name = params.fetch("query_name")
    the_brand.location = params.fetch("query_location")
    the_brand.business_type = params.fetch("query_business_type")
    the_brand.annual_revenue = params.fetch("query_annual_revenue")
    the_brand.description = params.fetch("query_description")
    the_brand.website_url = params.fetch("query_website_url")
    the_brand.insta_url = params.fetch("query_insta_url")
    the_brand.requirements = params.fetch("query_requirements")
    the_brand.logo = params.fetch("query_logo")

    if the_brand.valid?
      the_brand.save
      redirect_to("/brands/#{the_brand.id}", { :notice => "Brand updated successfully."} )
    else
      redirect_to("/brands/#{the_brand.id}", { :alert => the_brand.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @the_brand.destroy
    redirect_to("/brands", { :notice => "Brand deleted successfully."} )
  end

  private

  def set_brand
    matching = Brand.where({ :id => params.fetch("path_id") })
    @the_brand = matching.at(0)
  end

  def authorize_user!
    unless current_user.admin? || @the_brand.user_id == current_user.id
      redirect_to("/", { :alert => "You are not authorized to do that." })
      return
    end
  end

end
