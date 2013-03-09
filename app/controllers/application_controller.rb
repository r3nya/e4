# coding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :wide_assigments, :need_one_admin, :set_locale
  after_filter :store_location

  def admin_access
    unless current_user.try(:admin?)
      redirect_to root_path
    end
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def wide_assigments
    # Widely used assigments (variables, needed everywhere)
    if user_signed_in?
      @user = current_user
    end
    @menulinks = Menulink.ordered
    @localelist = [['en', 'English'], ['ru', 'Русский']]
  end

  def need_one_admin
    # For using administrative interface we need at least one admin. If there's no admins in this installation, first
    # user (User.first) will be admin automatically. If there's no users, we will redirect to new user registration with
    # flashing error.
    # You cannot leave yarb without admins :3
    if User.admins.empty?
      if User.first.nil?
        flash[:error] = t 'common.messages.errors.no_users'
        redirect_to main_app.new_user_registration_path unless request.fullpath =~ /\/users/
      else
        User.first.toggle!(:admin)
        flash[:error] = t 'common.messages.warnings.new_admin', :user => User.first.nick
      end
    end
  end

  def set_locale
    if params[:locale].blank?
      if cookies[:locale].blank?
        I18n.locale = extract_locale_from_accept_language_header
      else
        I18n.locale = cookies[:locale]
      end
    else
      I18n.locale = params[:locale]
      cookies[:locale] = {
          :value => params[:locale],
          :expires => 20.years.from_now.utc
      }
    end
  end

  def extract_locale_from_accept_language_header
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)
    if I18n.available_locales.include? browser_locale
      browser_locale
    else
      I18n.default_locale
    end
  end

  # Messages functions
  def form_invalid
    flash.now[:error] = t 'common.messages.errors.form_invalid'
  end

  # Save destroy
  # If condition == condition_value, object will be destroyed, and user will be redirected to redirect.
  # If not, user will be redirected but message with reason will appear
  def save_destroy(condition, condition_value, object, redirect, reason)
    if condition == condition_value
      object.destroy
      redirect_to redirect
    else
      flash.now[:error] = (t 'common.messages.errors.forbidden', :reason => reason)
      redirect_to redirect
    end
  end
end
