class Admin::ForumController < ApplicationController
  before_filter :admin_access

  def index
    flash.now[:notice] = t 'admin.messages.keep_translations_clean'
    @metaforums = Metaforum.all
  end
end
