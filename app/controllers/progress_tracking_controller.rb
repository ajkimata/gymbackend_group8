class ProgressTrackingController < ApplicationController

    def index
        @tracks = ProgressTracking.all
        render json: @tracks
    end

    def create
        @track = ProgressTracking.new(task_params)
        if @track.save
            render json: @track, status: :created
        else
            render json: @track.errors, status: :unprocessable_entity
        end
    end

    def update
        @track = ProgressTracking.find(params[:id])
        if @track.update(task_params)
            render json: @track
        else
            render json: @track.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @track = ProgressTracking.find(params[:id])
        @track.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:client_id, :progress_details)
    end

end
