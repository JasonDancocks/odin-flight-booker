class PassengerMailer < ApplicationMailer
	default from: "notifications@example.com"

	def welcome_email(booking)
		@booking = booking
		@url = root_url
		@lead_passenger = @booking.passengers.first
		@flight = booking.flight
		mail(to:@lead_passenger,subject: "Welcome to FlightBooker")
	end
end
