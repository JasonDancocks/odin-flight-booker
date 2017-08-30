Airport.delete_all
Flight.delete_all
Booking.delete_all
Passenger.delete_all

i = 0
airport_codes = %w[ATL PEK DXB ORD HND LHR LAX HKG CDG DFW]

while i < airport_codes.length
	Airport.create(code: airport_codes[i])
	i+= 1
end

10.times do
	airports = Airport.all.sample(2)
	o_a_id = airports[0].id
	d_a_id = airports[1].id
	t = rand(1..10)
	d = rand(60..600)

	flight = Flight.create(origin_airport_id: o_a_id, destination_airport_id: d_a_id, flight_duration:  d,start_date: Time.now + t.days)

end

Flight.all.each do |f|

	rand(1..5).times do
		f.bookings.build.save

	end
end

Booking.all.each do |b| 

	rand(5..20).times do
		passenger_name = Faker::GameOfThrones.character
		passenger_email = Faker::Internet.email(passenger_name.gsub(/\s+/, ''))
		b.passengers.build(name: passenger_name, email: passenger_email).save
	end
end