require './test/test_helper'

class LikeTest < ActiveSupport::TestCase
  user = User.new(name: "Janae", password: "password", password_confirmation: "password", email: "janae@janae.janae")
  child = Child.new(name: "Hazel", birthdate: "09/14/2018")
  post = Post.new(user: user, child: child)

  RSpec.describe Like, :type => :model do
    it "is valid with valid attributes" do
      like = Like.new(likeable: post, user: user)
      expect(like).to be_valid
    end

    it "is not valid without a likeable" do
      like = Like.new(user: user)
      expect(like).to_not be_valid
    end

    it "is not valid without a user" do
      like = Like.new(likeable: post)
      expect(like).to_not be_valid
    end
  end
end
