class StudiosController < ApplicationController
    def show
        @studio = Studio.find(params[:id])
        @actors = @studio.all_actors
    end
end