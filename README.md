# otlob-rails

1) Run:   git clone https://github.com/ahmedKhaled1995/otlob-rails.git

2) Run:   cd otlob-rails

3) You migth get "Required ruby-2.6.6 is not installed." , if so you will run the command:
		rvm install "ruby-2.6.6"
		
4) Run:   bundle install

5) Run:   npm i

6) Run: rails db:migrate

7) Run:  rails s    then visit localhost:3000

PS if an error occurs when visiting the localhost, close the server and run the following two commands:
	(1) gem uninstall sqlite3
	(2) gem install sqlite3
