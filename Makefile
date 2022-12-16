export PYTHONPATH := 'scr'
export PIPENV_VERBOSITY := -1

run:
	@pipenv run python src/script.py

install:
	@pipenv install --dev --skip-lock

lint:
	@pipenv run black .
	@pipenv run isort .