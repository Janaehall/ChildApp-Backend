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
    find_milestone
    @milestone.delete
  end

  def update
    find_milestone
    @milestone.update(milestone_params)
    @milestone.save
    render json: @milestone
  end

  private

  def find_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:child_id, :content, :date)
  end
end
