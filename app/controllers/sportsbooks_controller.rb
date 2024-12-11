class SportsbooksController < ApplicationController
  def index
    matching_sportsbooks = Sportsbook.all

    @list_of_sportsbooks = matching_sportsbooks.order({ :created_at => :desc })

    render({ :template => "sportsbooks/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_sportsbooks = Sportsbook.where({ :id => the_id })

    @the_sportsbook = matching_sportsbooks.at(0)

    render({ :template => "sportsbooks/show" })
  end

  def create
    the_sportsbook = Sportsbook.new
    the_sportsbook.name = params.fetch("query_name")

    if the_sportsbook.valid?
      the_sportsbook.save
      redirect_to("/sportsbooks", { :notice => "Sportsbook created successfully." })
    else
      redirect_to("/sportsbooks", { :alert => the_sportsbook.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_sportsbook = Sportsbook.where({ :id => the_id }).at(0)

    the_sportsbook.name = params.fetch("query_name")

    if the_sportsbook.valid?
      the_sportsbook.save
      redirect_to("/sportsbooks/#{the_sportsbook.id}", { :notice => "Sportsbook updated successfully."} )
    else
      redirect_to("/sportsbooks/#{the_sportsbook.id}", { :alert => the_sportsbook.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_sportsbook = Sportsbook.where({ :id => the_id }).at(0)

    the_sportsbook.destroy

    redirect_to("/sportsbooks", { :notice => "Sportsbook deleted successfully."} )
  end
end
