server:
	DEV_PORT=3000 ./bin/dev

bundle:
	./bin/bundle

db_reset:
	./bin/rails db:reset

db_seed:
	./bin/rails db:seed

application_setup: bundle db_reset db_seed

test:
	./bin/bundle exec rspec
