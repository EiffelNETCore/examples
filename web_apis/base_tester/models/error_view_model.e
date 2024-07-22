note
	description: "Summary description for {ERROR_VIEW_MODEL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ERROR_VIEW_MODEL

feature -- Access

	request_id: detachable STRING assign set_request_id

feature -- Element change

	set_request_id (v: STRING)
		do
			request_id := v
		ensure
			request_id_assigned: request_id = v
		end

feature -- operation

	show_request_id: BOOLEAN
		do
			Result := False
			if attached request_id as l_request_id and then
				not l_request_id.is_empty
			then
				Result := True
			end
		end

end
