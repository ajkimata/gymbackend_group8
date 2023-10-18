class ClientMembershipController < ApplicationController

    def index
        @memberships = ClientMembership.all
        render json: @memberships
    end

    def create
        @membership = ClientMembership.new(task_params)
        if @membership.save
            render json: @membership, status: :created
        else
            render json: @membership.errors, status: :unprocessable_entity
        end
    end

    def update
        @membership = ClientMembership.find(params[:id])
        if @membership.update(task_params)
            render json: @membership
        else
            render json: @membership.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @membership = ClientMembership.find(params[:id])
        @membership.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:membership_type, :membership_description, :client_id)
    end

end
