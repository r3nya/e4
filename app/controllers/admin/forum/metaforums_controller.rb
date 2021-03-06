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
      form_invalid
      render 'new'
    end
  end

  def edit
    @metaforum = Metaforum.find(params[:id])
  end

  def update
    @metaforum = Metaforum.find(params[:id])
    if @metaforum.update_attributes(params[:metaforum])
      redirect_to admin_forum_index_path
    else
      flash.now[:error] = t 'common.messages.errors.form_invalid'
      render 'edit'
    end
  end

  def destroy
    @metaforum = Metaforum.find(params[:id])
    save_destroy(@metaforum.forums.count, 0, @metaforum, admin_forum_index_path, (t 'common.messages.errors.non_empty'))
  end
end
