Airport.delete_all
Flight.delete_all

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

	Flight.create(origin_airport_id: o_a_id, destination_airport_id: d_a_id, flight_duration:  d,start_date: Time.now + t.days)
end