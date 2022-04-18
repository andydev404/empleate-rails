# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :authenticate_account!, only: %i[new create update edit]

  def index
    filter_values = {}
    filter_values[:filter] = "province = #{params[:province]}" if params[:province].present?

    @jobs = Job.includes(:account)
               .includes(:province)
               .order(created_at: :desc)
               .search(params[:search_term], filter_values)
  end

  def new
    @job = Job.new
    @provinces = Province.all
  end

  def create
    @provinces = Province.all
    @job = Job.new(job_params)
    @job.account = current_account

    if @job.save
      redirect_to current_account
    else
      render :new
    end
  end

  def show
    @job = Job.includes(:account).includes(:province).find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @provinces = Province.all

    if @job.update(job_params)
      redirect_to job_details_path(@job.slug)
    else
      render :edit
    end
  end

  def edit
    @job = Job.find(params[:id])
    @provinces = Province.all
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to current_account
  end

  private

  def job_params
    params.require(:job).permit(:title, :province_id, :description)
  end
end
