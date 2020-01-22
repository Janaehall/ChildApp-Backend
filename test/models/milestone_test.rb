require './test/test_helper'

class MilestoneTest < ActiveSupport::TestCase
  user = User.new(name: "Janae", password: "password", password_confirmation: "password", email: "janae@janae.janae")
  child = Child.new(name: "Hazel", birthdate: "09/14/2018")
  post = Post.new(user: user, child: child)

  RSpec.describe Milestone, :type => :model do
    it "is valid with valid attributes" do
      milestone = Milestone.new(child: child, content: "Hazel learns to walk!", date: "05/10/2019")
      expect(milestone).to be_valid
    end

    it "is not valid without a child" do
      milestone = Milestone.new(content: "Hazel learns to walk!", date: "05/10/2019")
      expect(milestone).to_not be_valid
    end

    it "is not valid without a date" do
      milestone = Milestone.new(child: child, content: "Hazel learns to walk!")
      expect(milestone).to_not be_valid
    end

    it "is not valid without content" do
      milestone = Milestone.new(child: child, date: "05/10/2019")
      expect(milestone).to_not be_valid
    end
  end
end
