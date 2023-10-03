note
	description: "Summary description for {SENTIMENT_PREDICTION}."
	date: "$Date$"
	revision: "$Revision$"

class
	SENTIMENT_PREDICTION_OLD

inherit

	SENTIMENT_DATA

feature -- Access

	prediction: BOOLEAN
		note
			column_name: create {COLUMN_NAME_ATTRIBUTE}.make ("PredictedLabel") end
		attribute
		end

	probability: REAL_64 assign set_probability

	score: REAL_64 assign set_score

feature -- Element Change

	set_probability (a_value: like probability)
		do
			probability := a_value
		end

	set_score (a_score: like score)
		do
			score := a_score
		end
end
