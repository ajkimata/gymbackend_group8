class RoleController < ApplicationController

    def index
        @roles = Role.all
        render json: @roles
    end

    def create
        @role = Role.new(task_params)
        if @role.save
            render json: @role, status: :created
        else
            render json: @role.errors, status: :unprocessable_entity
        end
    end

    def update
        @role = Role.find(params[:id])
        if @role.update(task_params)
            render json: @role
        else
            render json: @role.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @role = Role.find(params[:id])
        @role.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:role_name, role_description)
    end

end
