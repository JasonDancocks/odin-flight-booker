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
		@booking = Booking.new(booking_params)
		@flight = Flight.find(params[:booking][:flight_id])
		if @booking.save!
			redirect_to @booking
			flash[:success] = "Booking successful"
		else
			flash[:warning] = "Booking failed"
			render "new"
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
	end

end
