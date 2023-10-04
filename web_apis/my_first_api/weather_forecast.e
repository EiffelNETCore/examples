note
	description: "Summary description for {WEATHER_FORECAST}."
	date: "$Date$"
	revision: "$Revision$"

class
	WEATHER_FORECAST


inherit

	SYSTEM_OBJECT

feature -- Access

	date: DATE_ONLY assign set_date
		note
			property: auto
		 	property_metadata: create {JSON_PROPERTY_ATTRIBUTE}.make ("date") end
		do
			Result := internal_date
		end

	temperature_c: INTEGER assign set_temperature_c
		note
			property: auto
		 	property_metadata: create {JSON_PROPERTY_ATTRIBUTE}.make ("temperature_c") end
		do
			Result := internal_temperature_c
		end

	temperature_f: INTEGER
		note
			property: auto
		 	property_metadata: create {JSON_PROPERTY_ATTRIBUTE}.make ("temperature_f") end
		do
			Result := ((temperature_c * 9/ 5) + 32).truncated_to_integer
		end

	summary: SYSTEM_STRING assign set_summary
		note
			property: auto
		 	property_metadata: create {JSON_PROPERTY_ATTRIBUTE}.make ("summary") end
		do
			Result := internal_summary
		end


feature -- Element Change

	set_date (a_date: like date)
			-- Set `date' with `a_date'
		do
			internal_date := a_date
		ensure
			date_set: date = a_date
		end

	set_temperature_c (a_temperature_c: like temperature_c)
			-- Set `temperature' with `a_temperature_c'
		do
			internal_temperature_c := a_temperature_c
		ensure
			temperature_set: temperature_c = a_temperature_c
		end

	set_summary (a_summary: like summary)
			-- Set `summary' with `a_summary'
		do
			internal_summary := a_summary
		ensure
			summary_set: summary = a_summary
		end


feature {NONE} -- Implementations

	internal_date: DATE_ONLY
		note
			property: auto
			property_metadata: create {NS_JSON_IGNORE_ATTRIBUTE}.make end
		attribute
		end

	internal_temperature_c: INTEGER
		note
			property: auto
			property_metadata: create {NS_JSON_IGNORE_ATTRIBUTE}.make end
		attribute
		end

	internal_summary: detachable SYSTEM_STRING
		note
			property: auto
			property_metadata: create {NS_JSON_IGNORE_ATTRIBUTE}.make end
		attribute
		end


end
