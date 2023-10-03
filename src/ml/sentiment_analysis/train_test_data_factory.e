note
	description: "Summary description for {TRAIN_TEST_DATA_FACTORY}."
	date: "$Date$"
	revision: "$Revision$"

class
	TRAIN_TEST_DATA_FACTORY

feature -- Access

	train_test_split_with_fraction (a_data: IDATA_VIEW; test_fraction: REAL_64)
		require
			valid_test_fraction: test_fraction > 0.0 and then test_fraction < 1.0
		local
			text: SYSTEM_STRING
		do
		ensure
			instance_free: class
		end


	create_split_column (a_env: IHOST_ENVIRONMENT; a_data: IDATA_VIEW; a_sampling_key_column_name: detachable SYSTEM_STRING; a_seed: detachable CELL[INTEGER]; a_fallback_in_env_seed: BOOLEAN): SYSTEM_STRING
		do

		end
end
