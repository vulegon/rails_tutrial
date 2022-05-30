class ApplicationController < ActionController::Base
  def hello
    render html: "hello app"
  end
end
