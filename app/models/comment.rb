class Comment < ActiveRecord::Base
	belongs_to :show

	validates_presence_of :show_id
	validates_presence_of :time
	validates_presence_of :content, :message => "Please add your comment content."
end
