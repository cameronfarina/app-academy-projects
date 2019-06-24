class GoalsController < ApplicationController

    def index
      @goals = Goal.all
      render :index
    end
end
