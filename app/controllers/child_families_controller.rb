class ChildFamiliesController < ApplicationController
  def create
    params.permit!
    child = Child.find(params[:child_id])
    user = User.find_by(email: params[:family_member])
  if user && child.family_members.include?(user)
    render json: {error: 'Family Member Already Exists!'}
  elsif user
      ChildFamily.create(child_id: child.id, family_member_id: user.id)
      render json: {message: 'Family Member Added!'}
    else
      render json: {error: 'User Not Found!'}
    end
  end
end
