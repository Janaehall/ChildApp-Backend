require './test/test_helper'

class UserTest < ActiveSupport::TestCase
  # user = User.new(name: "Janae", password: "password", password_confirmation: "password", email: "janae@janae.janae")
  # child = Child.new(name: "Hazel", birthdate: "09/14/2018")

  RSpec.describe User, :type => :model do
    it "is valid with valid attributes" do
      user = User.new(name: "Janae", password: "password", password_confirmation: "password", email: "janae@janae.janae")
      p user.valid?
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(password: "password", password_confirmation: "password", email: "janae@janae.janae")
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.new(name: "Janae", email: "janae@janae.janae")
      expect(user).to_not be_valid
    end
  end
end
