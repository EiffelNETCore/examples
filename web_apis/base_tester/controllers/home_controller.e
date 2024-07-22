note
	description: "Summary description for {HOME_CONTROLLER}."
	date: "$Date$"
	revision: "$Revision$"

class
	HOME_CONTROLLER

inherit

	CONTROLLER


feature -- Access

	index: IACTION_RESULT
		note
				property_metadata: create {HTTP_GET_ATTRIBUTE}.make ("Index") end
		do
			Result := view
		end


	math_form: VIEW_RESULT
		note
			property_metadata: create {HTTP_GET_ATTRIBUTE}.make ("MathForm") end
		do
			Result := view
		end


	math_result(value: INTEGER): VIEW_RESULT
		note
			property_metadata: create {HTTP_POST_ATTRIBUTE}.make ("MathForm") end
		local
			l_math: MATH_MODEL
		do
			create l_math
			l_math.set_x(value)
			Result := view_object(l_math)
		end


end
