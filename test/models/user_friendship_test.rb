require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creatinga friendship works without raising an exception" do
  	assert_nothing_raised do
  	  UserFriendship.create user: users(:taylor), friend: users(:mike)
  	end
  end

  test "that creating friendship based on user id and friend id works" do
    UserFriendship.create user_id: users(:taylor).id, friend_id: users(:mike).id
    assert users(:taylor).friends.include?(users(:mike))
  end  
end
