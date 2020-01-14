class ChildrenController < ApplicationController

  def create
    params.permit!
    parent = User.find(params[:child][:parent])
    child = Child.create(child_params)
    child.parents.push(parent)
    child.save
    if child.valid?
      render json: child
    else
      render json: {errors: child.errors.full_messages}
    end
  end

  def show
    child = Child.find(params[:id])
    render json: child
  end

  def destroy
    child.find(params[:id]).delete
  end

  private

  def child_params
    params.require(:child).permit(:id, :name, :birthdate, :parents, :photo)
  end
end
