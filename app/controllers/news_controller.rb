class NewsController < ApplicationController
  def index
    @news = Post.news.ordered
  end

  def lenta
    # News wide lenta
    @news = Post.news.ordered
  end
end
