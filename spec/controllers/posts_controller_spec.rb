require 'rails_helper'

describe PostsController do
  describe "GET #index" do
    it "populates an array of posts" do
    post = FactoryGirl.create(:post)
    get :index
    assigns(:posts).should eq([post])
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested post to @post" do
      post = FactoryGirl.create(:post)
      get :show, id: post
      assigns(:post).should eq(post)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:post)
      response.should render_template :show
    end
  end
  
  describe "GET #new" do
    it "assigns a new Post to @post" do
      get :new

    end

    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new post in the database" do
      expect{
        post :create, post: FactoryGirl.attributes_for(:post)
      }.to change(Post,:count).by(1)
    end
    
      it "redirects to the home page" do
        post :create, post: FactoryGirl.attributes_for(:post)
        response.should redirect_to Post.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new post in the database"  do
        expect{
        post :create, post: FactoryGirl.attributes_for(:invalid_post)
        }.to_not change(Post,:count)
      end
      it "re-renders the :new template" do
        post :create, post: FactoryGirl.attributes_for(:invalid_post)
        response.should render_template :new
    end
    end
  end
end