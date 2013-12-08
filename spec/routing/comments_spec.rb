require  "spec_helper"

describe "comment"  do
	it "should route  shows/1/comments to comments#create" do
		{:post=>"/shows/1/comments"}.should route_to(:controller=>"comments", :action=>"create", :show_id=>"1") 
	end

	it "should route shows/1/comments/1 to comments#destroy" do
		{:delete=>"/shows/1/comments/1"}.should route_to(:controller=>"comments", :action=>"destroy",:show_id=>"1", :id=>"1")
	end

	it "should route shows/1/comments/new to comments#new" do
		{:get=>"/shows/1/comments/new"}.should route_to(:controller=>"comments", :action=>"new", :show_id=>"1")
	end
end