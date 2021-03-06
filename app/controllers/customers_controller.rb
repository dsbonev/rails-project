class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        flash[:just_created] = true
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        logger.info { "customer not created: #{@customer.errors.messages}" }
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def template
    sleep 0.5
    render "customers/template/#{params[:name].underscore}", layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      company_attributes = %i(name address number email type listed_on_exchange)
                            .push(supporting_document_attributes: [:file])
                            .push(directors_attributes: [:name])
                            .push(partners_attributes: [:name])
                            .push(trustees_attributes: [:name])
      params.require(:customer).permit(broker_ids: [], company_attributes: company_attributes)
    end
end
