
class AuthController < ApplicationController
  def create
    params.permit!
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      user.profile_pic.attached? ? profile_pic = url_for(user.profile_pic) : profile_pic = "https://www.sackettwaconia.com/wp-content/uploads/default-profile.png"
      token =  JWT.encode({user_id: user.id}, 'mykey', 'HS256')
      render json: {id: user.id, name: user.name, profile_pic: profile_pic, children: user.children, friends_children: user.friends_children, token: token}
    else
      render json: { error: 'invalid credentials' }, status: 401
    end
  end

  def show
    token = request.headers['Authorization'].split(' ')[1]
    decode = JWT.decode token, 'mykey', true, { algorithm: 'HS256' }
    user_id = decode[0]['user_id']
    user = User.find(user_id)

    if user
      user.profile_pic.attached? ? profile_pic = url_for(user.profile_pic) : profile_pic = "https://www.sackettwaconia.com/wp-content/uploads/default-profile.png"
      render json: {id: user.id, profile_pic: profile_pic, name: user.name, children: user.children, friends_children: user.friends_children, token: token}
    else
      render json: { error: 'invalid token' }, status: 401
    end
  end
end
