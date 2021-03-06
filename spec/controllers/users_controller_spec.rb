require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do

  describe "POST #create" do
    
    before(:each) do
      @user_params = {:name => "Larry", :role => "Developer"}
    end
    
    def do_post
      post :create, :user => @user_params
    end
    
    it "should create a new user" do
      lambda { do_post }.should change(User, :count).by(1)
    end

    it "should assign the user for the view" do
      do_post
      assigns[:user].name.should == @user_params[:name]
      assigns[:user].role.should == @user_params[:role]
    end
  end
end
