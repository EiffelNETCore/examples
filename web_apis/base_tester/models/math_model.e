note
	description: "Summary description for {MATH_MODEL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATH_MODEL

feature -- Access

	x: INTEGER

feature -- Element change

	set_x (v: INTEGER)
		require
			valid_v: v = 9
		do
				--| Note: at the moment we have an issue with
				--| .NetCore an DbC.
			if v /= 9 then
				(create {EXCEPTIONS}).raise("ERROR, we only learn the square root of 9, try with 9!!!!")
			else
				x := v
			end
		ensure
			x_assigned: x = v
		end

feature -- Operation

	square_root: INTEGER
		do
			Result := 3
		end



end
