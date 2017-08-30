class BookingsController < ApplicationController

	def new
		@booking = Booking.new
		@flight = Flight.find(params[:flight_id])
		num_passengers = 	params[:passengers].to_i
		num_passengers.times do
			@booking.passengers.build
		end
	end


	def create
	end

	def show
	end

end
