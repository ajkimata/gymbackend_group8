class GymMaintenanceController < ApplicationController

    def index
        @maintenances = GymMaintenance.all
        render json: @maintenances
    end

    def create
        @maintenance = GymMaintenance.new(task_params)
        if @maintenance.save
            render json: @maintenance, status: :created
        else
            render json: @maintenance.errors, status: :unprocessable_entity
        end
    end

    def update
        @maintenance = GymMaintenance.find(params[:id])
        if @maintenance.update(task_params)
            render json: @maintenance
        else
            render json: @maintenance.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @maintenance = GymMaintenance.find(params[:id])
        @maintenance.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:gym_maintenance)
    end

end
