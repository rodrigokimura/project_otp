export PYTHONPATH := 'scr'
export PIPENV_VERBOSITY := -1

# If the first argument is "cli"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "cli"
  CLI_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(CLI_ARGS):;@:)
endif

run:
	@pipenv run python src/script.py $(CLI_ARGS)

install:
	@pipenv install --dev --skip-lock

lint:
	@pipenv run black .
	@pipenv run isort .