# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_account!, only: %i[show update]
  before_action :set_account, only: %i[show update]

  def index
    @companies = Account.all
  end

  def show
    @jobs = Account.friendly.find(params[:id]).jobs
  end

  def job_list
    @company = Account.includes(:jobs).friendly.find(params[:id])
  end

  def update
    if @account.update(account_params)
      redirect_to account_path(@account, tab: 'mi-cuenta'), notice: 'Perfil actualizado'
    end
  end

  private

  def set_account
    @account = Account.friendly.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:display_name, :website, :address, :logo_image, :cover_image)
  end
end
