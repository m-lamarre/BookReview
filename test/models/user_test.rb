require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # before_save { self.email = email.downcase }

  def setup
    @user = User.new(username: "example_user", email: "test@test.com",
                      password: "pass123", password_confirmation: "pass123")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    unique_user = @user.dup
    unique_user.username = @user.username
    @user.save
    assert_not unique_user.valid?
  end

  test "email address should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email address should be unique" do
    unique_user = @user.dup
    unique_user.email = @user.email.upcase
    @user.save
    assert_not unique_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
