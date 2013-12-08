require 'spec_helper'

describe CommentsController do


  before :each do
    @show = FactoryGirl.create(:show)
  end

  describe "#create" do

    def perform
        post :create, :comment=>  {:content=> "great!"} , :show_id=>@show.id
    end

      it "should belongs to an exist show " do
        expect {perform}.to  change(Comment, :count).by(1)
        comment = Comment.last
        @show.comments.exists?(comment)
      end

      it "should  create a new comment" do
        expect{perform}.to change(Comment, :count).by(1)
        comment = Comment.last
        comment.show_id.should eq @show.id
        comment.content.should eq "great!"
        comment.time.should < Time.new
      end

      it "should redirect to show details page" do
        expect{perform}.to change(Comment, :count).by(1)
        response.should be_redirect
        response.location.should == show_url(@show)
      end

  end

  describe "#new" do

    def perform
            get :new, :show_id=>@show.id
    end

    it "should return success" do
        perform
        response.should be_success
    end

    it "should create an comment belongs to @show" do
        perform
        comment=assigns(:comment)
        comment.should be_an_instance_of(Comment)
        comment.show_id.should == @show.id
    end

  end

  describe "#destroy" do

    before :each do
      @comment=FactoryGirl.create(:comment)
    end

    def perform
      delete :destroy, :show_id=>@show.id, :id=>@comment.id
    end

    it "should redirect to show details" do
      perform
      response.should be_redirect
      response.location.should==show_url(@show)
    end

    it "should destroy a comment belongs to @show" do
      beforeSize = @show.comments.size
      expect{perform}.to change(Comment, :count).by(-1)
      (beforeSize-@show.comments.size).should == 1
    end

  end

end
