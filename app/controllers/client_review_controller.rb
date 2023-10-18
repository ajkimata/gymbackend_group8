class ClientReviewController < ApplicationController

    def index
        @reviews = ClientReview.all
        render json: @reviews
    end

    def create
        @review = ClientReview.new(task_params)
        if @review.save
            render json: @review, status: :created
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def update
        @review = ClientReview.find(params[:id])
        if @review.update(task_params)
            render json: @review
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @review = ClientReview.find(params[:id])
        @review.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:trainer_client_review, :client_id, :trainer_id)
    end

end
