class FlightsController < ApplicationController
	def index
		@airport_options = Airport.all.map { |a| [a.code, a.id]}
		@flight_dates = Flight.available_dates

		unless params[:commit].nil?
			@available_flights = Flight.available_flights(params)
		end
	end
end
