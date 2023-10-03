note
	description: "Project root class"
	--Note using a third party library we can have the same results.
class
	APPLICATION


create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_user: USER
			l_user2: USER
		do
			create l_user.make ("Joe", "Doe")

				 -- Serialize the User object to JSON
			{SYSTEM_CONSOLE}.write_line (l_user.to_json)

				-- Deserialize JSON String to User
			l_user2 := {USER}.from_json (l_user.to_json)
			{SYSTEM_CONSOLE}.write_line (l_user2.output)

			{SYSTEM_CONSOLE}.read_line.do_nothing()


		end


end
