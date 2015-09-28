class Article < ActiveRecord::Base
	belongs_to :users

	validates :title, :content, presence: true


end
