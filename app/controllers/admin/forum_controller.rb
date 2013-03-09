class Admin::ForumController < ApplicationController
  before_filter :admin_access

  def index
    @metaforums = Metaforum.all
  end
end
