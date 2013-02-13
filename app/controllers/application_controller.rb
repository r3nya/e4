# coding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :wide_assigments, :need_one_admin, :set_locale

  protected

    def wide_assigments
      # Widely used assigments (variables, needed everywhere)
      @user = current_user
    end

    def need_one_admin
      # For using administrative interface we need at least one admin. If there's no admins in this installation, first
      # user (User.first) will be admin automatically. If there's no users, we will redirect to new user registration with
      # flashing error.
      # You cannot leave yarb without admins :3
      if User.admins.empty?
        if User.first.nil?
          flash[:error] = t(:nouser)
          redirect_to main_app.new_user_registration_path unless request.fullpath =~ /\/users/
        else
          User.first.toggle!(:admin)
          flash[:error] = t 'newadmin', :user => User.first.nick
        end
      end
    end

    def set_locale
      @localelist = [['en', 'English'], ['ru', 'Русский']]
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
end
