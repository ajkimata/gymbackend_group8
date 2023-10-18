class GymReviewController < ApplicationController

    def index
        @reviews = GymReview.all
        render json: @reviews
    end

    def create
        @review = GymReview.new(task_params)
        if @review.save
            render json: @review, status: :created
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def update
        @review = GymReview.find(params[:id])
        if @review.update(task_params)
            render json: @review
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @review = GymReview.find(params[:id])
        @review.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:gym_review, :client_id)
    end

end
