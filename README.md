# otlob-rails

1) Run:   git clone REPO_LINK

2) Run:   cd otlob-rails

3) You migth get "Required ruby-2.6.6 is not installed." , if so you will run the command:
		rvm install "ruby-2.6.6"
		
4) Run:   bubdle install

5) Run:   npm i

6) Run: rails db:migrate

7) Run:  rails s    then visit localhost:3000

PS if an error occurs when visiting the localhost, close the server and run the following commands:
	gem uninstall sqlite3
	gem install sqlite3
