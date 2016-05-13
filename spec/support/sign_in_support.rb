#module for helping controller specs
module ValidUserHelper
  def signed_in_as_a_valid_user new_user = nil
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user ||= (new_user || FactoryGirl.create(:user))
      sign_in @user # method from devise:TestHelpers
    end
  end
end

# module for helping request specs
module ValidUserRequestHelper

  # for use in request specs
  def sign_in_as_a_valid_user new_user = nil
    @user ||= (new_user || FactoryGirl.create(:user))
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end
end

RSpec.configure do |config|
  config.include ValidUserHelper, :type => :controller
  config.include ValidUserRequestHelper, :type => :request
end
