class NewsController < ApplicationController
  def index
    @news = Post.news.ordered
  end
end
