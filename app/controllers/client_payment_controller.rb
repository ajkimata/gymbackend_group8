class ClientPaymentController < ApplicationController

    def index
        @payments = ClientPayment.all
        render json: @payments
    end

    def create
        @payment = ClientPayment.new(task_params)
        if @payment.save
            render json: @payment, status: :created
        else
            render json: @payment.errors, status: :unprocessable_entity
        end
    end

    def update
        @payment = ClientPayment.find(params[:id])
        if @payment.update(task_params)
            render json: @payment
        else
            render json: @payment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @payment = ClientPayment.find(params[:id])
        @payment.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:client_id, :payment_amount, :payment_method, :membership_type)
    end

end
