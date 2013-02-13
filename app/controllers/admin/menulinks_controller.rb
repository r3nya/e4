class Admin::MenulinksController < ApplicationController
  before_filter :admin_access

  def index
    flash.now[:notice] = t(:translations_ftw)
  end

  def new
    @menulink = Menulink.new()
  end

  def create
    @menulink = Menulink.new(params[:menulink])
    if @menulink.save
      redirect_to admin_menulinks_path
    else
      render 'new'
    end
  end
end
