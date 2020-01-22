require './test/test_helper'

class ChildTest < ActiveSupport::TestCase

  RSpec.describe Child, :type => :model do
    it "is valid with valid attributes" do
      child = Child.new
      child.birthdate = "02/08/1996"
      child.name = "Janae"
      expect(child).to be_valid
    end

    it "is not valid without a name" do
      child = Child.new
      child.birthdate = "02/08/1996"
      expect(child).to_not be_valid
    end

    it "is not valid without a birthdate" do
      child = Child.new
      child.name = "Janae"
      expect(child).to_not be_valid
    end

  end
end
