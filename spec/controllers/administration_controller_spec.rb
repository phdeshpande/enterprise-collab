require 'spec_helper'

describe AdministrationController do

  describe "GET 'manage_users'" do
    it "returns http success" do
      get 'manage_users'
      response.should be_success
    end
  end

  describe "GET 'manage_accounts'" do
    it "returns http success" do
      get 'manage_accounts'
      response.should be_success
    end
  end

end
