class Admin::BaseController < ApplicationController
  http_basic_authenticate_with(:name => "admin", :password => "rhok-toronto-2012")

  protected
end
