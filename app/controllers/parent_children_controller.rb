class ParentChildrenController < ApplicationController
  def create
    params.permit!
    child = Child.find(params[:child_id])
    user = User.find_by(email: params[:family_member])
  if user && child.parents.include?(user)
    render json: {error: 'Parent Already Exists!'}
  elsif user
      ParentChild.create(child_id: child.id, parent_id: user.id)
      render json: {message: 'Parent Added!'}
    else
      render json: {error: 'User Not Found'}
    end
  end
end
