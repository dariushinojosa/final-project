Rails.application.routes.draw do

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
  post("/insert_bet", { :controller => "bets", :action => "create" })
          
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
