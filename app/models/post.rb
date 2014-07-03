class Post < ActiveRecord::Base
	
	has_many :comments , dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }


	#def comments
	#	Comment.where({post_id: id})
	#end

	def ultimo
		comments.last
	end

end
