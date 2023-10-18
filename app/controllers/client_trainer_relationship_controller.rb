class ClientTrainerRelationshipController < ApplicationController
    
    def index
        @relations = ClientTrainerRelationship.all
        render json: @relations
    end

    def create
        @relation = ClientTrainerRelationship.new(task_params)
        if @relation.save
            render json: @relation, status: :created
        else
            render json: @relation.errors, status: :unprocessable_entity
        end
    end

    def update
        @relation = ClientTrainerRelationship.find(params[:id])
        if @relation.update(task_params)
            render json: @relation
        else
            render json: @relation.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @relation = ClientTrainerRelationship.find(params[:id])
        @relation.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:client_id, :trainer_id)
    end

end
