class HomeController < ApplicationController
  def index
    @companies = Account.includes(:jobs).order(created_at: :desc).limit(6).load_async
    @jobs = Job.includes(:account).includes(:province).order(created_at: :desc).limit(6).load_async
  end
end
