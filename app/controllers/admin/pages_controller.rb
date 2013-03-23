class Admin::PagesController < ApplicationController
  before_filter :admin_access
  crudify :static_page
end
