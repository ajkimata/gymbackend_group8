class GymEquipmentController < ApplicationController
    
    def index
        @equipments = GymEquipment.all
        render json: @equipments
    end

    def create
        @equipment = GymEquipment.new(task_params)
        if @equipment.save
            render json: @equipment, status: :created
        else
            render json: @equipment.errors, status: :unprocessable_entity
        end
    end

    def update
        @equipment = GymEquipment.find(params[:id])
        if @equipment.update(task_params)
            render json: @equipment
        else
            render json: @equipment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @equipment = GymEquipment.find(params[:id])
        @equipment.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:gym_equipment_type, :model_number, :serial_number, :purchase_date, :gym_maintenance_schedule)
    end

end
