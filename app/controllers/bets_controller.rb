class BetsController < ApplicationController
  def index
    matching_bets = Bet.all

    @list_of_bets = matching_bets.order({ :created_at => :desc })

    render({ :template => "bets/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bets = Bet.where({ :id => the_id })

    @the_bet = matching_bets.at(0)

    render({ :template => "bets/show" })
  end

  def create1
    @the_sportsbook = params.fetch("query_sportsbook_id")
    @the_sport = params.fetch("query_sport_id")
    if @the_sportsbook.blank? || @the_sport.blank?
      redirect_to("/bets", { alert: "Please select a sportsbook and a sport." })
    else
      redirect_to("/bets/?query_sportsbook_id=#{@the_sportsbook}&query_sport_id=#{@the_sport}")
    end
  end

  def create2
    the_bet = Bet.new
    the_bet.name = params.fetch("query_name")
    the_bet.event_id = params.fetch("query_event_id")
    the_bet.sportsbook_id = params.fetch("query_sportsbook_id")
    the_bet.odds = params.fetch("query_odds")
    the_bet.status = params.fetch("query_status")
    the_bet.stake = params.fetch("query_stake")

    if the_bet.valid?
      the_bet.save
      redirect_to("/bets", { :notice => "Bet created successfully." })
    else
      redirect_to("/bets", { :alert => the_bet.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bet = Bet.where({ :id => the_id }).at(0)

    the_bet.name = params.fetch("query_name")
    the_bet.event_id = params.fetch("query_event_id")
    the_bet.sportsbook = params.fetch("query_sportsbook")
    the_bet.odds = params.fetch("query_odds")
    the_bet.status = params.fetch("query_status")

    if the_bet.valid?
      the_bet.save
      redirect_to("/bets/#{the_bet.id}", { :notice => "Bet updated successfully."} )
    else
      redirect_to("/bets/#{the_bet.id}", { :alert => the_bet.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bet = Bet.where({ :id => the_id }).at(0)

    the_bet.destroy

    redirect_to("/bets", { :notice => "Bet deleted successfully."} )
  end
end
