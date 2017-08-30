class Flight < ApplicationRecord
	belongs_to :destination_airport, class_name: :Airport
	belongs_to :origin_airport, class_name: :Airport

	def self.available_dates
		flights = all.order(start_date: :asc)
		flights.map {|f| f.start_date_formatted}.uniq
	end

	def start_date_formatted
		start_date.strftime("%d/%m/%Y")
	end

	def self.available_flights(origin,destination,date)
		where(origin_airport_id:origin, destination_airport_id: destination, date: parse_date(date))
	end

	def parse_date(date)
		datetime = date.to_date
		datetime.beginning_of_day..datetime.end_of_day
	end

end
