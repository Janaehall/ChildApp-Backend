class ChildrenController < ApplicationController

  def create
    params.permit!
    parent = User.find(params[:child][:parent])
    child = Child.create(child_params)
    child.save
    child.parents.push(parent)
    Milestone.create(child_id: child.id, content: "#{child.name} was born", date: child.birthdate)
    if child.valid?
      render json: child
    else
      render json: {errors: child.errors.full_messages}
    end
  end

  def show
    render json: child
  end

  def update
    child.update(name: params[:child][:name], birthdate: params[:child][:birthdate], photo: params[:child][:photo])
    child.save
    render json: ChildSerializer.new(child).info_only
  end
  
  def destroy
    child.delete
  end

  private

  def child
    Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:id, :name, :birthdate, :parents, :photo)
  end
end
