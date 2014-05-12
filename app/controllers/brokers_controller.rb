class BrokersController < ApplicationController
  before_action :set_broker, only: [:show, :edit, :update, :destroy]

  # GET /brokers
  # GET /brokers.json
  def index
    @brokers = Broker.all
  end
end
