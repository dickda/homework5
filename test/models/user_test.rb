require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.create(fname:'John', lname:'Smith',email: "jsmith@aol.com")
  end

  test "this should be a valid person" do
    assert @user.valid?
  end
  
  test "first name should not be blank" do 
    @user.fname = ""
    assert_not @user.valid?
  end
  
   test "last name should not be blank" do 
    @user.lname = ""
    assert_not @user.valid?
  end
  
  test "email should not be blank" do 
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email should be valid only" do 
    @user.email = "gvsu.edu"
    assert_not @user.valid?
  end
  
  test "Users with the same email address can not be created" do 
     assert_no_difference('User.count') do
       @temp = User.create(email: @user.email , fname: @user.fname, lname: @user.lname, thumbnail: @user.thumbnail)
    end
  end
  
  test "thumbnail should not be able to blank" do 
    @user.thumbnail = ""
    assert @user.valid?
  end
  
  test "thumbnail should be valid only" do 
    @user.thumbnail = "gvsuedu"
    assert_not @user.valid?
  end

end
