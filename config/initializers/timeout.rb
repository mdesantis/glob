# Abort requests that are taking too long. See:
# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#timeout
Rack::Timeout.timeout = 20 # seconds
