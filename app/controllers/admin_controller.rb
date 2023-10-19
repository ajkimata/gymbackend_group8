class AdminController < ApplicationController
  def index
    @admins = Admin.all
    render json: @admins
  end

  def create
    @admin = Admin.new(task_params)
    if @admin.save
      render json: @admin, status: :created
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(task_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:admin).permit(:username, :email)
  end
end
