class Article < ActiveRecord::Base
	belongs_to :users

	validates :title, :artcile, presence: true


end
