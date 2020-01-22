require './test/test_helper'

class PostTest < ActiveSupport::TestCase
  user = User.new(name: "Janae", password: "password", password_confirmation: "password", email: "janae@janae.janae")
  child = Child.new(name: "Hazel", birthdate: "09/14/2018")

  RSpec.describe Post, :type => :model do
    it "is valid with valid attributes" do
      post = Post.new(child: child, content: "New Hazel post!", user: user)
      expect(post).to be_valid
    end

    it "is not valid without a child" do
      post = Post.new(content: "New Hazel post!", user: user)
      expect(post).to_not be_valid
    end

    it "is not valid without content" do
      post = Post.new(child: child, user: user)
      expect(post).to_not be_valid
    end

    it "is not valid without a user" do
      post = Post.new(child: child, content: "New Hazel post!")
      expect(post).to_not be_valid
    end
  end
end
