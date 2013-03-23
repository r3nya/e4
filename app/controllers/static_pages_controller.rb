class StaticPagesController < ApplicationController
  def stub
  end

  def markdown
    if StaticPage.exists?(uri: params[:uri])
      @page = StaticPage.find_by_uri(params[:uri])
    else
      render 'static_pages/404'
    end
  end
end
