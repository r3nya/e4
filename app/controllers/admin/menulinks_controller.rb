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
      flash.now[:error] = t 'common.messages.errors.invalid_form'
      render 'new'
    end
  end

  def edit
    @menulink = Menulink.find(params[:id])
  end

  def update
    @menulink = Menulink.find(params[:id])
    if @menulink.update_attributes(params[:menulink])
      redirect_to admin_menulinks_path
    else
      form_invalid
      render 'edit'
    end
  end

  def destroy
    @menulink = Menulink.find(params[:id])
    @menulink.destroy
    redirect_to admin_menulinks_path
  end
end
