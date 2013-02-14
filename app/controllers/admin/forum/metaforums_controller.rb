class Admin::Forum::MetaforumsController < ApplicationController
  before_filter :admin_access

  def new
    @metaforum = Metaforum.new()
  end

  def create
    @metaforum = Metaforum.new(params[:metaforum])
    if @metaforum.save
      redirect_to admin_forum_index_path
    else
      render 'new'
    end
  end
end
