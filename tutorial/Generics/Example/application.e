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
			list_str: LIST_OF_STRING
			i: INTEGER
			list: ILIST
		do
			print ("Consuming C# Generics in Eiffel%N")

				-- Create an instance
			create list_str.make

				-- Add some strings to the list
			list_str.add ("Item 1")
			list_str.add ("Item 2")
			list_str.add ("Item 3")

				-- Check if item exist in the list
			{SYSTEM_CONSOLE}.write_line ("Constains Item 1")
			{SYSTEM_CONSOLE}.write_line (list_str.contains ("Item 1")) -- True
			{SYSTEM_CONSOLE}.write_line ("Constains Item 10")
			{SYSTEM_CONSOLE}.write_line (list_str.contains ("Item 10")) -- False

				-- Remove an item from the list

			list_str.remove ("Item 1")

				-- Get the list and print its contents

			list := list_str.get_list
			from
				i := 0
			until
				i = list.count
			loop
				if attached {SYSTEM_STRING} list.item (i) as l_item then
					{SYSTEM_CONSOLE}.write_line (l_item)
				end
				i := i + 1
			end
			io.read_line
		end

end
