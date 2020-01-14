class MilestonesController < ApplicationController

  def create
    milestone = Milestone.create(milestone_params)
    if milestone.valid?
      render json: milestone
    else 
      render json: {errors: milestone.errors.full_messages}
    end
  end

  def destroy
    Milestone.find(params[:id]).delete
  end

  def update
    milestone = Milestone.find(params[:id])
    milestone.update(milestone_params)
    milestone.save
    render json: milestone
  end

  def milestone_params
    params.require(:milestone).permit(:child_id, :content, :date)
  end
end
