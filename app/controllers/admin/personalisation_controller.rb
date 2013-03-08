class Admin::PersonalisationController < ApplicationController
  def index
    @personalisations = Personalisation.all
  end

  def edit
  end

  def update
  end
end
