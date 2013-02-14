class Admin::MenulinksController < ApplicationController
  before_filter :admin_access

  def index
    flash.now[:notice] = t 'admin.messages.keep_translations_clean'
  end

  def new
    @menulink = Menulink.new()
  end

  def create
    @menulink = Menulink.new(params[:menulink])
    if @menulink.save
      redirect_to admin_menulinks_path
    else
      flash.now[:error] = t 'common.messages.errors.form_common'
      render 'new'
    end
  end
end
