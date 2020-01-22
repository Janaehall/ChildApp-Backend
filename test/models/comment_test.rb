require './test/test_helper'

class CommentTest < ActiveSupport::TestCase
  user = User.new(name: "Janae", password: "password", password_confirmation: "password", email: "janae@janae.janae")
  child = Child.new(name: "Hazel", birthdate: "09/14/2018")
  post = Post.new(user: user, child: child)

  RSpec.describe Comment, :type => :model do
    it "is valid with valid attributes" do
      comment = Comment.new
      comment.commentable = post
      comment.content = "Cool!"
      comment.user = user
      expect(comment).to be_valid
    end

    it "is not valid without a commentable" do
      comment = Comment.new
      comment.content = "cool!"
      comment.user = user
      expect(comment).to_not be_valid
    end

    it "is not valid without content" do
      comment = Comment.new
      comment.commentable = post
      comment.user = user
      expect(comment).to_not be_valid
    end

    it "is not valid without a user" do
      comment = Comment.new
      comment.commentable = post
      comment.content = "Cool!"
      expect(comment).to_not be_valid
    end
  end
end
