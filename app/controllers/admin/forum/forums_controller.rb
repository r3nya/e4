class Admin::Forum::ForumsController < ApplicationController
  before_filter :admin_access
  before_filter :preload_vars

  def new
    @metaforum = Metaforum.find(params[:metaforum_id])
    @forum = ::Forum.new()
    @forum.metaforum = @metaforum
  end

  def create
    @metaforum = Metaforum.find(params[:forum][:metaforum_id])
    @forum = ::Forum.new(params[:forum])
    @forum.metaforum = @metaforum
    if @forum.save
      redirect_to admin_forum_index_path
    else
      flash.now[:error] = t 'common.messages.errors.form_invalid'
      render 'new'
    end
  end

  def edit
    @metaforum = Metaforum.find(params[:metaforum_id])
    @forum = ::Forum.find_by_url(params[:id])
  end

  def update
    @metaforum = Metaforum.find(params[:forum][:metaforum_id])
    @forum = ::Forum.find_by_url(params[:id])
    @forum.metaforum = @metaforum
    if @forum.update_attributes(params[:forum])
      redirect_to admin_forum_index_path
    else
      flash.now[:error] = t 'common.messages.errors.form_invalid'
      render 'edit'
    end
  end

  def destroy
    @metaforum = Metaforum.find(params[:metaforum_id])
    @forum = ::Forum.find_by_url(params[:id])
    if @forum.posts.count == 0
      @forum.destroy
      redirect_to admin_forum_index_path
    else
      flash.now[:error] = (t 'common.messages.errors.forbidden', :reason => (t 'common.messages.errors.non_empty'))
      redirect_to admin_forum_index_path
    end
  end

  def preload_vars
    @metaforums = Metaforum.all
  end
end
