class Show < ActiveRecord::Base
	has_many :comments, dependent: :destroy

  	validates_presence_of :name, :message => "Please specify a name."
  	validates_presence_of :picture, :message => "Please specify a picture."
end