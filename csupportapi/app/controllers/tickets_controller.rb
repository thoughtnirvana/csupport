class TicketsController < ApplicationController
  before_action :ember_params, only: [:create, :update]
  before_action :set_ticket, only: [:show, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all

    render json: @tickets
  end

  # GET /tickets/1
  def show
    render json: @ticket
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ember_params
      if params[:data]
        params[:data][:attributes].delete("owner")
        current_status = params[:data][:attributes]["curstatus"]
        params[:data][:attributes].delete("curstatus")
        current_status.nil? ? (status=0) : (status = Ticket::STATUS_HASH[current_status.to_sym])
        params[:ticket] = params[:data][:attributes]
        params[:ticket][:user_id] = 1
        params[:ticket][:status] = status
      end
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_params
      unless params[:ticket].empty?
        params.require(:ticket).permit(:name, :user_id, :description, :status)
      end
    end
end
