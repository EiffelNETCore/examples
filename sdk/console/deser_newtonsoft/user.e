note
	description: "Summary description for {REPOSITORY}."
	date: "$Date$"
	revision: "$Revision$"


class
	USER

inherit

	SYSTEM_OBJECT


create
	make

feature {NONE} -- Initialization

	make (a_fn, a_ln: STRING)
		do
			first_name := a_fn
			last_name := a_ln
		end
feature -- Access


	first_name: STRING_8

	last_name: STRING_8

--	first_name: SYSTEM_STRING

--	last_name: SYSTEM_STRING

	id: INTEGER



feature -- Convertion

	to_json: SYSTEM_STRING
		do
			Result := {SYSTEM_STRING}.empty
			Result := {JSON_CONVERT}.serialize_object_object_type(Current, Result.generating_type.to_cil, Void)
		end


	from_json (a_json: SYSTEM_STRING): USER
		local
			conv: JSON_CONVERT
		do
			create Result.make ("", "")
			{SYSTEM_CONSOLE}.write_line(Result.generator.to_cil)
			if attached {USER} {JSON_CONVERT}.deserialize_object_string_type(a_json, Result.generating_type.to_cil) as l_user then
			   	Result := l_user
			end
		ensure
			is_class: class
		end

	output: SYSTEM_STRING
		do
			Result := {SYSTEM_STRING}.concat_string_string_3 ("User: ", first_name, " ", last_name)
		end

end
