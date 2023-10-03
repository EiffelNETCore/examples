note
	description: "Project root class"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			builder: WEB_APPLICATION_BUILDER
		do
			print ("Eiffel .Net6 template project")
		end
end
