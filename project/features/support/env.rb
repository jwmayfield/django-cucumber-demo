require 'capybara/cucumber'
require 'capybara-webkit'

Capybara.run_server = false
Capybara.app_host = "http://localhost:12345"
Capybara.automatic_reload = false
Capybara.default_driver = :webkit

World do
  @virtualenv_path = File.expand_path(File.dirname(__FILE__) + "/../../../")
  `python #{@virtualenv_path}/project/manage.py testserver --addrport 12345 #{@virtualenv_path}/project/fixtures/test_admin_user.json > #{@virtualenv_path}/tmp/testrun.log 2>&1 &`
end

Before do
  begin
    visit('/')
  rescue Capybara::Webkit::InvalidResponseError
    retry
  end
end

at_exit do
  `ps -ef | grep '.*manage.py testserver .*[: ]*12345' | grep -v grep | awk '{print $2}' | xargs kill -9`
end
