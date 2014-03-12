class Subject < ActiveRecord::Base

	# THe most important thing about classes is relations.. hwo they are related

	# has_one :page
	has_many :pages



	# Defining Named Scoped

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first, lambda { order("subjects.created_at DESC") }

	scope :search, lambda { |query|
		where(["name LIKE ?", "%#{query}%"])
	}

end
