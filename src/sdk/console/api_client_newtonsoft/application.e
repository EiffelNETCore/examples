note
	description: "Project root class"
	EIS: "name=HTTP Request", "src=https://github.com/dotnet/samples/tree/main/csharp/getting-started/console-webapiclient", "protocol=uri"

	--Note using a third party library we can have the same results.
class
	APPLICATION

--inherit

--	SYSTEM_OBJECT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			client: HTTP_CLIENT
			repositories: ARRAY_LIST
			l_repo: REPOSITORY
			i: INTEGER
		do
			create client.make
			client.default_request_headers.add ("Accept", "application/vnd.github.v3+json")
			client.default_request_headers.add ("User-Agent", ".NET Foundation Repository Reporter")

				-- Simple test
			l_repo := {REPOSITORY}.from_json (json_element.to_cil)
			{SYSTEM_CONSOLE}.write_line (l_repo.Name)

			process_repositories (client)
			io.read_line
		end

	process_repositories (a_client: HTTP_CLIENT)
		local
			l_request: HTTP_REQUEST_MESSAGE
			l_response: HTTP_RESPONSE_MESSAGE
			l_stream: SYSTEM_STREAM
			l_objc: SYSTEM_OBJECT
			l_arr: ARRAY_LIST
			l_repo: REPOSITORY
			l_serializer: JSON_SERIALIZER
			i: INTEGER
			l_text_reader: JSON_TEXT_READER
			l_stream_reader: STREAM_READER
		do
			create l_request.make_from_method_and_request_uri ({HTTP_METHOD}.get, "")
			a_client.set_base_address (create {URI}.make_from_uri_string ("https://api.github.com/orgs/dotnet/repos"))
			l_response := a_client.send_http_request_message (l_request)

				-- Deserialize the stream
			create l_serializer.make
			create l_arr.make
			create l_stream_reader.make (l_response.content.read_as_stream)
			create l_text_reader.make (l_stream_reader)

			l_objc := l_serializer.deserialize_json_reader_type (l_text_reader, l_arr.generating_type.to_cil)

			if attached {ARRAY_LIST} l_objc as l_array then
				{SYSTEM_CONSOLE}.write_line (l_array.count)

				from
					i := 0
				until
					i = l_array.count
				loop
					{SYSTEM_CONSOLE}.write (l_array.item (i).to_string())
					l_repo := {REPOSITORY}.from_json (l_array.item (i).to_string())

					{SYSTEM_CONSOLE}.write_line ("Name:"); {SYSTEM_CONSOLE}.write_line (l_repo.name)
					{SYSTEM_CONSOLE}.write_line ("Homepage:"); {SYSTEM_CONSOLE}.write_line (l_repo.home_page)
					{SYSTEM_CONSOLE}.write_line ("GitHub:"); {SYSTEM_CONSOLE}.write_line (l_repo.git_hub_homeurl)
					{SYSTEM_CONSOLE}.write_line ("Description:"); {SYSTEM_CONSOLE}.write_line (l_repo.description)
					{SYSTEM_CONSOLE}.write_line ("Watchers:"); {SYSTEM_CONSOLE}.write_line (l_repo.watchers)
					{SYSTEM_CONSOLE}.write_line ("LastPush:"); {SYSTEM_CONSOLE}.write_line (l_repo.last_push)
					{SYSTEM_CONSOLE}.write_line ("%N============%N");

					i := i + 1
				end
			end

			create l_repo

			l_repo.set_name ("Eiffel.Net7")
			l_repo.set_description ("Testing")
			l_repo.set_home_page (create {URI}.make("http://example.com"))

			{SYSTEM_CONSOLE}.write_line (l_repo.to_json)

		end

	json_element: STRING = "[
				{"id":4149293,"node_id":"MDEwOlJlcG9zaXRvcnk0MTQ5Mjkz","name":"cecil","full_name":"dotnet/cecil","private":false,"owner":{"login":"dotnet","id":9141961,"node_id":"MDEyOk9yZ2FuaXphdGlvbjkxNDE5NjE=","avatar_url":"https://avatars.githubusercontent.com/u/9141961?v=4","gravatar_id":"","url":"https://api.github.com/users/dotnet","html_url":"https://github.com/dotnet","followers_url":"https://api.github.com/users/dotnet/followers","following_url":"https://api.github.com/users/dotnet/following{/other_user}","gists_url":"https://api.github.com/users/dotnet/gists{/gist_id}","starred_url":"https://api.github.com/users/dotnet/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/dotnet/subscriptions","organizations_url":"https://api.github.com/users/dotnet/orgs","repos_url":"https://api.github.com/users/dotnet/repos","events_url":"https://api.github.com/users/dotnet/events{/privacy}","received_events_url":"https://api.github.com/users/dotnet/received_events","type":"Organization","site_admin":false},"html_url":"https://github.com/dotnet/cecil","description":"Cecil is a library to inspect, modify and create .NET programs and libraries.","fork":true,"url":"https://api.github.com/repos/dotnet/cecil","forks_url":"https://api.github.com/repos/dotnet/cecil/forks","keys_url":"https://api.github.com/repos/dotnet/cecil/keys{/key_id}","collaborators_url":"https://api.github.com/repos/dotnet/cecil/collaborators{/collaborator}","teams_url":"https://api.github.com/repos/dotnet/cecil/teams","hooks_url":"https://api.github.com/repos/dotnet/cecil/hooks","issue_events_url":"https://api.github.com/repos/dotnet/cecil/issues/events{/number}","events_url":"https://api.github.com/repos/dotnet/cecil/events","assignees_url":"https://api.github.com/repos/dotnet/cecil/assignees{/user}","branches_url":"https://api.github.com/repos/dotnet/cecil/branches{/branch}","tags_url":"https://api.github.com/repos/dotnet/cecil/tags","blobs_url":"https://api.github.com/repos/dotnet/cecil/git/blobs{/sha}","git_tags_url":"https://api.github.com/repos/dotnet/cecil/git/tags{/sha}","git_refs_url":"https://api.github.com/repos/dotnet/cecil/git/refs{/sha}","trees_url":"https://api.github.com/repos/dotnet/cecil/git/trees{/sha}","statuses_url":"https://api.github.com/repos/dotnet/cecil/statuses/{sha}","languages_url":"https://api.github.com/repos/dotnet/cecil/languages","stargazers_url":"https://api.github.com/repos/dotnet/cecil/stargazers","contributors_url":"https://api.github.com/repos/dotnet/cecil/contributors","subscribers_url":"https://api.github.com/repos/dotnet/cecil/subscribers","subscription_url":"https://api.github.com/repos/dotnet/cecil/subscription","commits_url":"https://api.github.com/repos/dotnet/cecil/commits{/sha}","git_commits_url":"https://api.github.com/repos/dotnet/cecil/git/commits{/sha}","comments_url":"https://api.github.com/repos/dotnet/cecil/comments{/number}","issue_comment_url":"https://api.github.com/repos/dotnet/cecil/issues/comments{/number}","contents_url":"https://api.github.com/repos/dotnet/cecil/contents/{+path}","compare_url":"https://api.github.com/repos/dotnet/cecil/compare/{base}...{head}","merges_url":"https://api.github.com/repos/dotnet/cecil/merges","archive_url":"https://api.github.com/repos/dotnet/cecil/{archive_format}{/ref}","downloads_url":"https://api.github.com/repos/dotnet/cecil/downloads","issues_url":"https://api.github.com/repos/dotnet/cecil/issues{/number}","pulls_url":"https://api.github.com/repos/dotnet/cecil/pulls{/number}","milestones_url":"https://api.github.com/repos/dotnet/cecil/milestones{/number}","notifications_url":"https://api.github.com/repos/dotnet/cecil/notifications{?since,all,participating}","labels_url":"https://api.github.com/repos/dotnet/cecil/labels{/name}","releases_url":"https://api.github.com/repos/dotnet/cecil/releases{/id}","deployments_url":"https://api.github.com/repos/dotnet/cecil/deployments","created_at":"2012-04-26T15:49:43Z","updated_at":"2023-06-24T20:25:22Z","pushed_at":"2023-08-14T12:29:32Z","git_url":"git://github.com/dotnet/cecil.git","ssh_url":"git@github.com:dotnet/cecil.git","clone_url":"https://github.com/dotnet/cecil.git","svn_url":"https://github.com/dotnet/cecil","homepage":"https://cecil.pe","size":19691,"stargazers_count":58,"watchers_count":58,"language":"C#","has_issues":false,"has_projects":false,"has_downloads":true,"has_wiki":false,"has_pages":false,"has_discussions":false,"forks_count":38,"mirror_url":null,"archived":false,"disabled":false,"open_issues_count":1,"license":{"key":"mit","name":"MIT License","spdx_id":"MIT","url":"https://api.github.com/licenses/mit","node_id":"MDc6TGljZW5zZTEz"},"allow_forking":true,"is_template":false,"web_commit_signoff_required":false,"topics":[],"visibility":"public","forks":38,"open_issues":1,"watchers":58,"default_branch":"main","permissions":{"admin":false,"maintain":false,"push":false,"triage":false,"pull":true}}
			]"

end
