class ForumController < ApplicationController
  def index
    @metaforums = Metaforum.all
  end
end
