note
	description: "Project root class"
	assembly_metadata: create {APPLICATION_PART_ATTRIBUTE}.make("Microsoft.AspNetCore.OpenApi")end

class
	APPLICATION

inherit
	SYSTEM_OBJECT
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_controller: HOME_CONTROLLER
			builder: WEB_APPLICATION_BUILDER
			l_native: NATIVE_ARRAY [SYSTEM_STRING]
			l_mvc_builder: IMVC_BUILDER
			l_service_collection: ISERVICE_COLLECTION
			l_app: WEB_APPLICATION
			l_services : ISERVICE_COLLECTION
			l_current: SYSTEM_OBJECT
			l_enumerator: IENUMERATOR
			l_stop: BOOLEAN
			l_web_options: WEB_APPLICATION_OPTIONS
			l_math_model: MATH_MODEL
			l_error_view_model: ERROR_VIEW_MODEL
		do

				-- Create the web Application
			builder := {WEB_APPLICATION}.create_builder()


				-- Add services to the container
			l_services := builder.services

			{MVC_SERVICE_COLLECTION_EXTENSIONS}.add_controllers_with_views(l_services).do_nothing()


			l_app := builder.build


			{HTTPS_POLICY_BUILDER_EXTENSIONS}.use_https_redirection (l_app).do_nothing()

			{AUTHORIZATION_APP_BUILDER_EXTENSIONS}.use_authorization (l_app).do_nothing()

			{STATIC_FILE_EXTENSIONS}.use_static_files(l_app).do_nothing()

			{ENDPOINT_ROUTING_APPLICATION_BUILDER_EXTENSIONS}.use_routing(l_app).do_nothing()

			{CONTROLLER_ENDPOINT_ROUTE_BUILDER_EXTENSIONS}.map_controller_route (l_app,
			  "default",	-- name
			  "{controller=Home}/{action=Index}/{id?}", -- pattern,
			  Void, --defautls
			  Void, --contraints
			  Void --data tokens
			).do_nothing()

			l_app.run(Void)

		end



end
