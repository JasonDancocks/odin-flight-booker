class FlightsController < ApplicationController
  def index
  	@airport_options = Airport.all.map { |a| [a.code, a.id]}
  	@flight_dates = Flight.available_dates
  	@available_flights = Flight.available_flights
  end
end
