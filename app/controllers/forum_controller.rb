class ForumController < ApplicationController
  def index
    @metaforums = Metaforum.all
  end

  def show
    @forum = Forum.find_by_url(params[:id])
  end
end
