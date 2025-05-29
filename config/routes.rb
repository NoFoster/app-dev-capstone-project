Rails.application.routes.draw do

  get("/", {:controller => "misc", :action => "homepage" })
  get("athletes/new", { :controller => "athletes", :action => "create" })

  devise_for :installs
  # Routes for the Athlete resource:

  # CREATE
  post("/insert_athlete", { :controller => "athletes", :action => "create" })
          
  # READ
  get("/athletes", { :controller => "athletes", :action => "index" })
  
  get("/athletes/:path_id", { :controller => "athletes", :action => "show" })
  
  # UPDATE
  
  post("/modify_athlete/:path_id", { :controller => "athletes", :action => "update" })
  
  # DELETE
  get("/delete_athlete/:path_id", { :controller => "athletes", :action => "destroy" })

  #------------------------------

  # Routes for the Brand resource:

  # CREATE
  post("/insert_brand", { :controller => "brands", :action => "create" })
          
  # READ
  get("/brands", { :controller => "brands", :action => "index" })
  
  get("/brands/:path_id", { :controller => "brands", :action => "show" })
  
  # UPDATE
  
  post("/modify_brand/:path_id", { :controller => "brands", :action => "update" })
  
  # DELETE
  get("/delete_brand/:path_id", { :controller => "brands", :action => "destroy" })

  #------------------------------

  devise_for(:users)

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
