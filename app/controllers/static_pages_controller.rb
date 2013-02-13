class StaticPagesController < ApplicationController
  def stub
    @title = t(:not_implemented)
  end
end
