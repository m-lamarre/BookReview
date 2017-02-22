require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "example_user", email: "test@email.com",
                      password: "pass123", password_confirmation: "pass123")
  end

  test "" do

  end
end
