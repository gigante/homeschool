.PHONY: local

local:
	heroku local

deploy:
	git push heroku master

graph:
	./manage.py graph_models \
		accounts \
		core \
		courses \
		schools \
		students \
		users \
		-o models.png

coverage:
	coverage run --source='homeschool' -m pytest --migrations
	coverage report

mypy:
	mypy homeschool project manage.py
