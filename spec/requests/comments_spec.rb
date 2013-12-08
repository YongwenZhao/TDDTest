require "spec_helper"

describe "add your comment" do 
	before  :each do
		@show = FactoryGirl.create(:show)
	end

=begin
	it "should be able to add your comment in index page" do
		visit "/"

		page.should have_content("Show List")
		page.should have_button("Comment")

		click_button("Comment" :match=>:first)

		assert_select "form[action=?]", "/comments/create" do
			assert_select "input[type=?, name=?]", "hidden", "showId"
			assert_select "input[type=?, name=?]" , "text", "content"
			assert_select "input[type=?, text=?]", "submit", "Add Comment"
		end

		fill_in "content", :with=>"Great!"
		click_button("Add Comment")

		page.should have_content("Great!")
		page.should have_content()
	end
=end

	it "should be able to add your comment in detail page" do
		visit show_path(@show)

		page.should have_content("Add Comment")

		fill_in "comment[content]", :with=>"Great!"
		click_button("Add Comment")

		page.should have_content("Great!")
	end

end

describe "show comments" do

	before  :each do
		@show = FactoryGirl.create(:show)
		@comment=FactoryGirl.create(:comment)
	end

	it "should display show's all the comments in detail page" do
		visit show_path(@show)
		page.should  have_content(@comment.content)
	end
end

describe "delete an exist comment" do
	before  :each do
		@show = FactoryGirl.create(:show)
		@comment=FactoryGirl.create(:comment)
	end
	it "should delete an exist comment" do
		visit show_path(@show)
		page.should have_link("Delete")

		 expect { click_link('Delete', :match => :first) }.to change(Comment, :count).by(-1)		
	end
end
