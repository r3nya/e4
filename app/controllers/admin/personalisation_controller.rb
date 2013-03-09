class Admin::PersonalisationController < ApplicationController
  def index
    @personalisations = Personalisation.all
  end

  def edit
    @personalisation = Personalisation.find(params[:id])
  end

  def update
    @personalisation = Personalisation.find(params[:id])
    if @personalisation.update_attributes(params[:personalisation])
      redirect_to admin_personalisation_index_path
    else
      flash.now[:error] = t 'common.messages.errors.form_invalid'
      render 'edit'
    end
  end
end
