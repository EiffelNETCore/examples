note
	description: "Analyze sentiment of website comments with binary classification in ML.NET implementated in Eiffel"
	EIS: "name=sentiment-analysis", "src=https://learn.microsoft.com/en-us/dotnet/machine-learning/tutorials/sentiment-analysis", "protocol=uri"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			ml_context_facade: ML_CONTEXT_FACADE
			l_data: SENTIMENT_DATA
			l_split_data_view: TRAIN_TEST_DATA_IN_DATA_OPERATIONS_CATALOG
			l_model: ITRANSFORMER
			l_context: ML_CONTEXT

		do
			print("Sentiment Analysis using Eiffel.Net %N")
			print (data_path)
			print("%NClick Enter to continue %N")
			io.read_line

				-- Initialize the ML Context
			create ml_context_facade.make()

				-- load data
			l_split_data_view := load_data (ml_context_facade)

			l_model := build_and_train_model (ml_context_facade, l_split_data_view)
			evaluate (ml_context_facade, l_split_data_view, l_model)
			use_model_with_single_item (ml_context_facade, l_model)
			use_model_with_batch_items (ml_context_facade, l_model)
			{SYSTEM_CONSOLE}.write_line
			{SYSTEM_CONSOLE}.write_line("====================== End of process =========================")
			print("%NClick Enter to end %N")
			io.read_line

		end

	data_path: SYSTEM_STRING
			--  dataset file path.
		local
			l_dir: SYSTEM_STRING
		do
			l_dir := {ENVIRONMENT}.current_directory
			Result := {SYSTEM_PATH}.combine_string_string_string (l_dir, "Data", "yelp_labelled.txt")
		end

feature {NONE} -- Implementation

	use_model_with_batch_items (a_context: ML_CONTEXT_FACADE; a_model: ITRANSFORMER)
			-- Creates batch test data.
			-- Predicts sentiment based on test data.
			-- Combines test data and predictions for reporting.
			-- Displays the predicted results.
		local
			sentiments: ARRAY_LIST
			l_data: SENTIMENT_DATA
			batch_comments: IDATA_VIEW
			batch_predictions: IDATA_VIEW
			prediction_results: ILIST
			i: INTEGER
		do
			create sentiments.make_from_capacity (2)
			create l_data.make
			l_data.set_sentiment_text_field ("This was a horrible meal")
			sentiments.add (l_data).do_nothing()
			create l_data.make
			l_data.set_sentiment_text_field ("I love this spaghetti.")
			sentiments.add (l_data).do_nothing()

			batch_comments := a_context.load_from_enumerable (sentiments)
			batch_predictions := a_context.transform (a_model, batch_comments)
			prediction_results := a_context.create_enumerable (batch_predictions, False)
			{SYSTEM_CONSOLE}.write_line
			{SYSTEM_CONSOLE}.write_line("=============== Prediction Test of loaded model with multiple samples ===============")
			{SYSTEM_CONSOLE}.write_line

			from
				i := 0
			until
				i = prediction_results.count
			loop
				if attached {SENTIMENT_PREDICTION} prediction_results.item (i) as l_prediction  then
					{SYSTEM_CONSOLE}.write_line
					print ("Sentiment: ")
					print (l_prediction.sentiment_text)
					print (" | Prediction: " + if l_prediction.prediction then "Positive" else "Negative" end)
					print (" | Probability: " + l_prediction.probability.out)
					{SYSTEM_CONSOLE}.write_line
				end
				i := i + 1
			end
			{SYSTEM_CONSOLE}.write_line("===============  End of predictions ===============")
		end

	use_model_with_single_item (a_context: ML_CONTEXT_FACADE; a_model: ITRANSFORMER)
			-- Creates a single comment of test data.
			-- Predicts sentiment based on test data.
			-- Combines test data and predictions for reporting.
			-- Displays the predicted results.
		local
			prediction_engine: PREDICTION_ENGINE_FACADE
			sample_statement: SENTIMENT_DATA
			result_prediction: SENTIMENT_PREDICTION
		do
			prediction_engine := a_context.create_prediction_engine (a_model)
			create sample_statement.make
			sample_statement.set_sentiment_text_field ("This was a very bad steak")
			result_prediction := prediction_engine.predict (sample_statement)
			{SYSTEM_CONSOLE}.write_line
			{SYSTEM_CONSOLE}.write_line ("=============== Prediction Test of model with a single sample and test dataset ===============")

			{SYSTEM_CONSOLE}.write_line
			print ("Sentiment: ")
			print (result_prediction.sentiment_text)
			print (" | Prediction: " + if result_prediction.prediction then "Positive" else "Negative" end)
			print (" | Probability: " + result_prediction.probability.out)
			{SYSTEM_CONSOLE}.write_line

			{SYSTEM_CONSOLE}.write_line
			{SYSTEM_CONSOLE}.write_line ("=============== End of Predictions ===============")
			{SYSTEM_CONSOLE}.write_line
		end

	evaluate (a_context: ML_CONTEXT_FACADE; a_split_data_view: TRAIN_TEST_DATA_IN_DATA_OPERATIONS_CATALOG; a_model: ITRANSFORMER)
			-- Loads the test dataset.
			-- Creates the BinaryClassification evaluator.
			-- Evaluates the model and creates metrics.
			-- Displays the metrics.
		local
			metrics: CALIBRATED_BINARY_CLASSIFICATION_METRICS
			predictions: IDATA_VIEW
			fd: FORMAT_DOUBLE
		do
			create fd.make (2, 2)
			fd.right_justify
			{SYSTEM_CONSOLE}.write_line ("=============== Evaluating Model accuracy with Test data===============")
			predictions := a_context.transform (a_model, a_split_data_view.test_set)
			metrics := a_context.evaluate (predictions, "Label")
			{SYSTEM_CONSOLE}.write_line
			{SYSTEM_CONSOLE}.write_line ("Model quality metrics evaluation")
			{SYSTEM_CONSOLE}.write_line ("Accuracy:" + fd.formatted (metrics.accuracy) + "%%")
			{SYSTEM_CONSOLE}.write_line ("Auc:" + fd.formatted (metrics.area_under_roc_curve) + "%%")
			{SYSTEM_CONSOLE}.write_line ("F1Score:" + fd.formatted (metrics.f1_score) + "%%")
			{SYSTEM_CONSOLE}.write_line ("=============== End of model evaluation ===============")
		end

	build_and_train_model (a_context: ML_CONTEXT_FACADE; a_split_data_view: TRAIN_TEST_DATA_IN_DATA_OPERATIONS_CATALOG): ITRANSFORMER
			-- Extracts and transforms the data.
			-- Trains the model.
			-- Predicts sentiment based on test data.
			-- Returns the model.
		local
			estimator: SENTIMENT_ESTIMATOR
		do
			estimator := a_context.featurize_sentiment_text ("Features", "SentimentText")
			{SYSTEM_CONSOLE}.write_line ("=============== Create and Train the Model ===============");
			Result := estimator.fit (a_split_data_view.train_set)
			{SYSTEM_CONSOLE}.write_line ("=============== End of training ===============");
			{SYSTEM_CONSOLE}.write_line()
		end

	load_data (a_context: ML_CONTEXT_FACADE): TRAIN_TEST_DATA_IN_DATA_OPERATIONS_CATALOG
			-- Loads the data.
			-- Splits the loaded dataset into train and test datasets.
			-- Returns the split train and test datasets.
		do
			Result := a_context.train_test_split (a_context.load_from_text_file (data_path, False), 0.2)
		end

end
