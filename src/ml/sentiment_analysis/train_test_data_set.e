note
	description: " A pair of datasets, for the train and test set."
	date: "$Date$"
	revision: "$Revision$"

class
	TRAIN_TEST_DATA_SET

create
	make

feature {NONE} -- Initialization

	make (a_train_set: IDATA_VIEW; a_test_set: IDATA_VIEW)
		do
			train_set := a_train_set
			test_set  := a_test_set
		ensure
			train_setted: train_set = a_train_set
			test_setted : test_set  = a_test_set
		end

feature -- Access

	train_set: IDATA_VIEW
		-- Training set.

	test_set: IDATA_VIEW
		-- Testing set.



end
