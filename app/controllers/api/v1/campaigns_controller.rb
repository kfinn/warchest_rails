class Api::V1::CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end
end
