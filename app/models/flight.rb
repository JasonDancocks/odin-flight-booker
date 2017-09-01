class Flight < ApplicationRecord
	belongs_to :destination_airport, class_name: :Airport
	belongs_to :origin_airport, class_name: :Airport
	has_many :flights
	has_many :bookings

	has_many :passengers, through: :bookings

	def self.available_dates
		flights = all.order(start_date: :asc)
		flights.map {|f| f.start_date_formatted}.uniq
	end

	def self.available_flights(params)
		parsed_date = parse_date(params[:start_date])
		where(origin_airport_id:params[:origin_airport_id], destination_airport_id: params[:destination_airport_id], start_date: parsed_date)
	end

	def self.parse_date(date)
		date_time = date.to_date
		date_time.beginning_of_day..date_time.end_of_day
	end
	
	def start_date_formatted
		start_date.strftime("%d/%m/%Y")
	end

	def flight_time
		start_date.strftime("%H : %M")
	end

	def airport(num)
		if num == 0
			return origin_airport.code
		elsif num == 1
			return destination_airport.code
		end
	end

end
