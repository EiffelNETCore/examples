note
	description: "Summary description for {REPOSITORY}."
	date: "$Date$"
	revision: "$Revision$"

-- Name
--
-- Using Newtonsof.JSON third party library.
-- Issues with the generation of the config file
-- deps.json, third party libraries are not included.

class
	REPOSITORY

inherit

	SYSTEM_OBJECT

feature -- Access

-- {"$$description":"Testing","GitHubHomeurl":null,"HomePage":"http://example.com","LastPushUtc":"0001-01-01T00:00:00",
-- "$$name":"Eiffel.Net7","Watchers":0,"eif_description":"Testing","eif_auto":"Eiffel.Net7"}


-- {"$$description":"Testing","GitHubHomeurl":null,"HomePage":"http://example.com","LastPushUtc":"0001-01-01T00:00:00",
--  "$$name":"Eiffel.Net7","Watchers":0,"description":"Testing","eif_auto":"Eiffel.Net7"}


--
--{"Description":"Testing","GitHubHomeurl":null,"HomePage":"http://example.com","LastPushUtc":"0001-01-01T00:00:00",
-- "$$name":"Eiffel.Net7","Watchers":0,"eif_auto":"Eiffel.Net7"}

	name: SYSTEM_STRING
		note
			property: "eif_auto"
		attribute
		end

	description: SYSTEM_STRING
		note
			property_metadata: create {JSON_PROPERTY_ATTRIBUTE}.make ("description") end,
							   create {EIFFEL_NAME_ATTRIBUTE}.make ("description") end
		attribute
		end

	git_hub_homeUrl: URI

	home_page: URI

	watchers: INTEGER

  	last_push_utc: SYSTEM_DATE_TIME

	last_push: SYSTEM_DATE_TIME

		do
			Result := last_push_utc.to_local_time
		end

feature -- Element Change

	set_name (a_name: SYSTEM_STRING)
		do
			name := a_name
		end

	set_git_hub_homeUrl (a_val: URI)
		do
			 git_hub_homeUrl := a_val
		end

	set_description (a_val: SYSTEM_STRING)
		do
			description := a_val
		end

	set_home_page (a_val: URI)
		do
			home_page := a_val
		end

	set_watchers (a_val: INTEGER)
		do
			watchers := a_val
		end

feature -- Convertion

	to_json: SYSTEM_STRING
		do
			Result := {SYSTEM_STRING}.empty
			Result := {JSON_CONVERT}.serialize_object_object_type(Current, Result.generating_type.to_cil, Void)
		end


	from_json (a_json: SYSTEM_STRING): REPOSITORY
		local
			conv: JSON_CONVERT
		do
			create Result
			{SYSTEM_CONSOLE}.write_line(Result.generator.to_cil)
			if attached {REPOSITORY} {JSON_CONVERT}.deserialize_object_string_type(a_json, Result.generating_type.to_cil) as l_repo then
			   	Result := l_repo
			end
		ensure
			is_class: class
		end

end
