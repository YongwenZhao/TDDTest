require 'spec_helper'

describe Comment do

  	it {should validate_presence_of(:show_id)}
  	it{should validate_presence_of(:time)}
	it {should validate_presence_of(:content) .with_message("Please add your comment content.")}

	it "should be valide " do
		Comment.new.valid?
	end
end