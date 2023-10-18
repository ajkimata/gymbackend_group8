class PermissionsController < ApplicationController

    def index
        @permissions = Permission.all
        render json: @permissions
    end

    def create
        @permission = Permission.new(task_params)
        if @permission.save
            render json: @permission, status: :created
        else
            render json: @permission.errors, status: :unprocessable_entity
        end
    end

    def update
        @permission = Permission.find(params[:id])
        if @permission.update(task_params)
            render json: @permission
        else
            render json: @permission.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @permission = Permission.find(params[:id])
        @permission.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:permission_name, permission_description)
    end

end
