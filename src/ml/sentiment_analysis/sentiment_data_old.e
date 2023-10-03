note
	description: "Summary description for {SENTIMENT_DATA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SENTIMENT_DATA_OLD

feature -- Access

	sentiment_text: detachable SYSTEM_STRING
		note
			load_column: create {LOAD_COLUMN_ATTRIBUTE}.make_from_field_index(0) end
		attribute
		end

	sentiment: BOOLEAN
		note
			load_column: create {LOAD_COLUMN_ATTRIBUTE}.make_from_field_index(1) end
			column_name: create {COLUMN_NAME_ATTRIBUTE}.make("Label") end
		attribute
		end

end
