Rails.application.routes.draw do
  devise_for :users

  root to: "bets#index"

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the Sportsbook resource:

  # CREATE
  post("/insert_sportsbook", { :controller => "sportsbooks", :action => "create" })
          
  # READ
  get("/sportsbooks", { :controller => "sportsbooks", :action => "index" })
  
  get("/sportsbooks/:path_id", { :controller => "sportsbooks", :action => "show" })
  
  # UPDATE
  
  post("/modify_sportsbook/:path_id", { :controller => "sportsbooks", :action => "update" })
  
  # DELETE
  get("/delete_sportsbook/:path_id", { :controller => "sportsbooks", :action => "destroy" })

  #------------------------------

  # Routes for the Sport resource:

  # CREATE
  post("/insert_sport", { :controller => "sports", :action => "create" })
          
  # READ
  get("/sports", { :controller => "sports", :action => "index" })
  
  get("/sports/:path_id", { :controller => "sports", :action => "show" })
  
  # UPDATE
  
  post("/modify_sport/:path_id", { :controller => "sports", :action => "update" })
  
  # DELETE
  get("/delete_sport/:path_id", { :controller => "sports", :action => "destroy" })

  #------------------------------

  # Routes for the Bet resource:

  # CREATE
  post("/insert_bet1", { :controller => "bets", :action => "create1" })
  post("/insert_bet2", { :controller => "bets", :action => "create2" })
  post("/insert_bet3", { :controller => "bets", :action => "create3" })

  # READ
  get("/bets", { :controller => "bets", :action => "index" })
  
  get("/bets/:path_id", { :controller => "bets", :action => "show" })
  
  # UPDATE
  
  post("/modify_bet/:path_id", { :controller => "bets", :action => "update" })
  
  # DELETE
  get("/delete_bet/:path_id", { :controller => "bets", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
